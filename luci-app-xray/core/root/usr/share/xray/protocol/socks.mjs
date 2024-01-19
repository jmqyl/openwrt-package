"use strict";

import { stream_settings } from "../common/stream.mjs";

export function socks_outbound(server, tag) {
    const stream_settings_object = stream_settings(server, "socks", tag);
    const stream_settings_result = stream_settings_object["stream_settings"];
    const dialer_proxy = stream_settings_object["dialer_proxy"];
    return {
        outbound: {
            protocol: "socks",
            tag: tag,
            settings: {
                servers: [
                    {
                        address: server["server"],
                        port: int(server["server_port"]),
                        users: [
                            {
                                user: server["username"],
                                pass: server["password"],
                            }
                        ]
                    }
                ]
            },
            streamSettings: stream_settings_result
        },
        dialer_proxy: dialer_proxy
    };
};
