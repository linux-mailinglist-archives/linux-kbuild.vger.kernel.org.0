Return-Path: <linux-kbuild+bounces-13101-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOn8BbUbAWpIQwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13101-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 01:58:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D399506D99
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 01:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A671C300764F
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2026 23:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C706336494B;
	Sun, 10 May 2026 23:58:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160A25FA29;
	Sun, 10 May 2026 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778457520; cv=none; b=ITxoG6rrCLJMbGpbS/PVP1SJhOHZDz1zNKEHzUaPUkmWx1bhhOryuvvsjJuEW89tO0WBFKeQh2YNGKA1PEkOBF5xn7dfX8qYQvhYSHUjYEIW+kX9xF738RhsSpyCVXw1LEL8kmo3a0HiVjPCbrfQ+ydstzL0Rhrjjgco9hsYO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778457520; c=relaxed/simple;
	bh=2rhICBrnjvQKjSHETyNKDFe9tZjuGklgUcrbR7oLisM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKlIVd5sKIfRxnH1OSjaZfgKdc++ZDB+Yt/vy6G26k5TS11ZaH8+FAUZwaDGdpSu9k+ni0pqPghiWpAwNNrPrZldxxB5f17SpSo+ji/Etsftwi0Nh+MaczFhPvgkxLLHlF2khNoYMxRP1wnSZA5LoJxysB28LjxTJBaEClLUHqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wME2R-000000000M7-0uGw;
	Sun, 10 May 2026 23:58:23 +0000
Date: Mon, 11 May 2026 00:58:15 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Guenter Roeck <linux@roeck-us.net>, Test User <test@example.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 0/3] dt-bindings: automated coding style check for DTS
 examples
Message-ID: <cover.1778454442.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 1D399506D99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13101-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[makrotopia.org];
	FREEMAIL_TO(0.00)[kernel.org,makrotopia.org,weissschuh.net,goodmis.org,wp.pl,roeck-us.net,example.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.851];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Documentation/devicetree/bindings/dts-coding-style.rst documents
the style expected of DT examples and source files, but nothing
existing actually enforces it. dtc tolerates arbitrary whitespace,
yamllint only sees the YAML envelope and not the DTS content
inside literal block scalars, and so reviewers spend cycles
flagging issues that tooling could catch.

Add scripts/dtc/dt-check-style, a Python tool that checks DTS
coding style on YAML binding examples and on .dts/.dtsi/.dtso
source files. Rules live in a small declarative registry; each
rule is tagged 'relaxed' (default) or 'strict' (opt-in for new
submissions). Promoting a rule from strict to relaxed is a
one-line edit once the tree catches up.

Relaxed mode covers trailing whitespace, tab characters in YAML
examples, mixed tab+space indents, and the per-input-type indent
character (1 tab for .dts/.dtsi/.dtso). It is zero-violation on
the current tree and runs as part of dt_binding_check_one, so no
new warnings appear in `make dt_binding_check`.

Strict mode adds indent unit and depth consistency; blank-line
policy (no consecutive blanks or blanks at body edges; required
blank line before each child node and before "status"); property
ordering by canonical bucket (compatible, reg/reg-names, ranges,
standard, vendor, status) with declarative within-bucket pairing
rules (<x>-names follows <x>, pinctrl-names follows the last
pinctrl-N) and natural-sort fallback; sibling node ordering by
unit address or natural-sort name; line length (80 columns);
continuation alignment of multi-line property values under the
first '<' or '"' after the '='; lowercase hex literals and unit
addresses; single-spaced values inside <...>; closing-brace
placement; and unused-label detection (skipped for .dtsi/.dtso
since labels there are exported to includers/applies-to).
Together these constrain a DT structure to a single canonical
rendering modulo the author's choice of when to wrap properties
for readability. Comments are intentionally out of scope. Strict
mode is opt-in, intended for use by checkpatch.pl in a follow-up
series.

The tool reads file paths from @argfile and parallelises across
CPUs via -j N. With no -j given it picks up $PARALLELISM (set by
scripts/jobserver-exec from the GNU make jobserver) and falls
back to os.cpu_count() otherwise. Running as one Python
invocation amortises the ruamel.yaml import across the whole
tree -- ~2s on a 32-CPU host vs ~28s sequential. ruamel.yaml is
the only non-stdlib dependency, already required by dtschema.

A selftest under scripts/dtc/dt-style-selftest/ pairs good/ and
bad/ fixtures with expected output so rule behaviour can be
exercised independently of the full tree via the
dt_style_selftest top-level make target.
---
v1: https://lore.kernel.org/all/cover.1776700167.git.daniel@makrotopia.org/
v2: https://lore.kernel.org/all/cover.1777471439.git.daniel@makrotopia.org/

Changes since v2:
 - route findings to stderr so a quiet dt_binding_check produces
   no output (Rob)
 - switch the Makefile recipe from mktemp to Kbuild's
   $(tmp-target) so build output stays inside the build folder
   (Nathan)
 - collapse the recipe's exit-handling tail into the familiar
   "&& touch $@ || true" pattern, matching cmd_chk_bindings;
   keeps future warnings non-fatal (Rob, Nathan)
 - explain in patch 2/3 why the recipe uses an explicit
   $(PYTHON3) prefix where the neighbouring recipes call their
   scripts directly (Rob)
 - append a trailing newline to every expected/*.txt selftest
   fixture (Rob)
 - restore the trailing whitespace inside yaml-trailing-ws.yaml
   that had been silently stripped during re-application, so the
   selftest actually exercises the trailing-whitespace rule

Changes since v1:
 - rules declared in a registry tagged relaxed/strict; default
   relaxed mode is zero-violation on the current tree
 - tool now also accepts .dts/.dtsi/.dtso files directly (with a
   tab-indent variant); unused-labels skipped for .dtsi/.dtso
   where labels are exported to includers/applies-to
 - renamed dt-check-example-style -> dt-check-style
 - added -j N with $PARALLELISM (jobserver) awareness
 - dropped node-name [a-z0-9-] check (Rob: better as a meta-schema)
 - property-order rebuilt around buckets + declarative pairing
   rules plus natural-sort fallback
 - added child-name-order, required-blank-lines, hex-case,
   unit-address-format, value-whitespace, node-close-alone,
   line-length and continuation-alignment to strict mode
 - new selftest patch (Krzysztof: "would be happy to see at
   least a few test cases for it")

Default relaxed mode is zero-violation on the current tree once
the small prep-cleanup series [1] has landed.

Strict-mode violation counts on a current tree (5506 YAML
bindings, 6530 in-tree .dts/.dtsi/.dtso under arch/):

  rule                         yaml      dts
  property-order              14457   240804
  indent-consistent            2435   294778
  continuation-alignment       2462   187914
  unused-labels                3611    11628
  required-blank-lines         1862    47351
  line-length                   102    25999
  child-name-order              664    16409
  mixed-indent-chars              0    13275
  indent-unit-strict           1493       --
  child-address-order            69     4075
  blank-lines                    91     1963
  value-whitespace               87      983
  node-close-alone               40      783
  hex-case                       78      666
  indent-unit                   181       --
  indent-unit-dts                --      202
  unit-address-format             5       39
  trailing-whitespace             0       10

(YAML and DTS columns reflect the rules that apply to each input
type; e.g. indent-unit-strict is YAML-only since .dts files use
tabs, indent-unit-dts is the equivalent DTS-only check.
unused-labels is skipped for .dtsi/.dtso since labels there are
exported to includers/applies-to.)

The script was written with generous help from Claude Opus 4.7,
since my Python is even worse than my DTS coding style.

[1] https://lore.kernel.org/all/cover.1777434096.git.daniel@makrotopia.org/

Daniel Golle (3):
  dt-bindings: add DTS style checker
  dt-bindings: wire style checker into dt_binding_check
  dt-bindings: add self-test fixtures for style checker

 Documentation/devicetree/bindings/Makefile    |   19 +-
 Makefile                                      |    6 +
 scripts/dtc/dt-check-style                    | 1063 +++++++++++++++++
 .../dtc/dt-style-selftest/bad/dts-spaces.dts  |   13 +
 .../bad/yaml-child-addr-order.yaml            |   41 +
 .../bad/yaml-child-name-order.yaml            |   37 +
 .../bad/yaml-cont-align.yaml                  |   30 +
 .../dt-style-selftest/bad/yaml-hex-case.yaml  |   29 +
 .../bad/yaml-indent-strict.yaml               |   29 +
 .../bad/yaml-line-length.yaml                 |   29 +
 .../bad/yaml-mixed-indent.yaml                |   29 +
 .../bad/yaml-node-close.yaml                  |   31 +
 .../bad/yaml-prop-order.yaml                  |   29 +
 .../bad/yaml-prop-pairing.yaml                |   33 +
 .../bad/yaml-required-blank.yaml              |   33 +
 .../dtc/dt-style-selftest/bad/yaml-tab.yaml   |   29 +
 .../bad/yaml-trailing-ws.yaml                 |   29 +
 .../dt-style-selftest/bad/yaml-unit-addr.yaml |   29 +
 .../bad/yaml-unused-label.yaml                |   29 +
 .../dt-style-selftest/bad/yaml-value-ws.yaml  |   29 +
 .../expected/dts-spaces.dts.txt               |    2 +
 .../expected/yaml-child-addr-order.yaml.txt   |    2 +
 .../expected/yaml-child-name-order.yaml.txt   |    2 +
 .../expected/yaml-cont-align.yaml.txt         |    2 +
 .../expected/yaml-hex-case.yaml.txt           |    2 +
 .../expected/yaml-indent-strict.yaml.txt      |    2 +
 .../expected/yaml-line-length.yaml.txt        |    2 +
 .../expected/yaml-mixed-indent.yaml.txt       |    3 +
 .../expected/yaml-node-close.yaml.txt         |    2 +
 .../expected/yaml-prop-order.yaml.txt         |    2 +
 .../expected/yaml-prop-pairing.yaml.txt       |    3 +
 .../expected/yaml-required-blank.yaml.txt     |    3 +
 .../expected/yaml-tab.yaml.txt                |    2 +
 .../expected/yaml-trailing-ws.yaml.txt        |    2 +
 .../expected/yaml-unit-addr.yaml.txt          |    2 +
 .../expected/yaml-unused-label.yaml.txt       |    2 +
 .../expected/yaml-value-ws.yaml.txt           |    2 +
 .../dtc/dt-style-selftest/good/dts-tab.dts    |   30 +
 .../dt-style-selftest/good/yaml-4space.yaml   |   41 +
 scripts/dtc/dt-style-selftest/run.sh          |   67 ++
 40 files changed, 1769 insertions(+), 2 deletions(-)
 create mode 100755 scripts/dtc/dt-check-style
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-tab.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
 create mode 100755 scripts/dtc/dt-style-selftest/run.sh

-- 
2.54.0

