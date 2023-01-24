import React from "react";
import Layout from "@theme/Layout";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";

export default function Index(): JSX.Element {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title={`Home`}
      pageClassName={`flex-column`}
      description="The easy way to run klipper on your 3D printer."
    >
      <main
        style={{
          flex: 1,
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "center",
          background:
            "radial-gradient(circle, rgba(22,22,22,1) 0%, rgba(47,47,47,1) 0%, rgba(22,22,22,1) 100%)",
        }}
      >
        <div style={{ position: "relative" }}>
          <img
            src="/img/logos/Logo-v2-white.svg"
            width={400}
            height={400}
            title="RatOS"
          />
          <small
            className="byline"
            style={{
              fontFamily: "oswald",
              position: "absolute",
              display: "block",
              bottom: 0,
              right: 40,
            }}
          >
            Formerly known as <span style={{ fontWeight: 500 }}>V-CoreOS</span>
          </small>
        </div>
        <p style={{ marginTop: 30, marginBottom: 30 }}>
          The easy way to run klipper on your 3D printer.
        </p>
        <p>
          <a
            href="https://github.com/Rat-OS/RatOS/releases"
            target="_blank"
            rel="noopener noreferrer"
          >
            <img
              src="https://img.shields.io/github/downloads/Rat-OS/RatOS/total?color=%2368da0b"
              alt="Downloads"
            />
          </a>
          <a
            href="http://discord.gg/ratrig"
            target="_blank"
            rel="noopener noreferrer"
            style={{ marginLeft: 5 }}
          >
            <img
              src="https://img.shields.io/discord/582187371529764864?color=%235865F2&amp;label=discord&amp;logo=discord&amp;logoColor=white&amp;style=flat"
              alt="discord"
            />
          </a>
        </p>
        <p>
          <ul>
            <li>Modular configuration with support for multiple printers</li>
            <li>Supports multiple controller boards, extruders and hotends</li>
            <li>Automatic firmware compilation and MCU flashing</li>
            <li>Based on Klipper, Moonraker and Mainsail</li>
          </ul>
        </p>
        <p>
          <a
            href="https://github.com/Rat-OS/RatOS/releases/latest"
            className="button button--primary"
          >
            Download
          </a>
          <a
            href="/docs/introduction"
            className="button button--outline button--secondary"
            style={{ marginLeft: 15 }}
          >
            Documentation
          </a>
        </p>
      </main>
    </Layout>
  );
}
