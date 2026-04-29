Return-Path: <linux-kbuild+bounces-12929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI+TEG8U8mljnwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12929-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 16:23:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB68495A16
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 16:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0B74304A203
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9073176EF;
	Wed, 29 Apr 2026 14:21:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CC0282F15;
	Wed, 29 Apr 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472504; cv=none; b=IDgF2fzkRSVOcCt8BqTg2eBbU4OFyFtcbNOQ8WRHuF3+uSQ+Mcs5T/gKztNeWewNkOeRaWLKPnwrqE90h6HADsPmDwdIoT8wQj4Sa+6CxgG1U0IS0V1x1DzwvmuQ+kEM88YalbHMCHPFXelJ9uGeomEb8AxYSIeFoR+nBFADLE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472504; c=relaxed/simple;
	bh=FYT8emQ2XifKe8qwEbDhOEUy4mJETMc7OOWLSMG/nSE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U4g+PBK8roNdaeyPmno0XXi8kLYoUi8E4bIQzCzpys2d/kKoRlS4SUm0tJ/j3PI1ZecwEbxD3yjqrZ0PcYXkiXtZZ0mQdd9mInBlPC+1hjbsvs8Lq1aEfC5PpyuX0PWXhc8EsLKLumRmelOZGZJvb63r2/hxY0yyocxVvOCFOQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wI5my-000000002RN-1Klr;
	Wed, 29 Apr 2026 14:21:20 +0000
Date: Wed, 29 Apr 2026 15:21:16 +0100
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
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Test User <test@example.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/3] dt-bindings: automated coding style check for DTS
 examples
Message-ID: <cover.1777471439.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: DFB68495A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12929-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,makrotopia.org,weissschuh.net,goodmis.org,roeck-us.net,wp.pl,example.com,vger.kernel.org];
	DMARC_NA(0.00)[makrotopia.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.175];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]

v1: https://lore.kernel.org/all/cover.1776700167.git.daniel@makrotopia.org/

Following v1 review feedback, this series replaces the original
single-mode checker with one organised around a declarative rule
registry. Each rule is tagged 'relaxed' (default; must be
zero-violation on the current tree) or 'strict' (opt-in for new
submissions); promoting a rule from strict to relaxed is a one-line
edit once the tree catches up.

Default mode runs cleanly on the current tree once the small prep
series [1] has landed. Stricter rules (indent unit, property
ordering, blank-line placement, sibling address ordering, unused
labels, line length, value rendering, ...) live behind --mode=strict
and are intended for use by checkpatch.pl in a follow-up series.

The tool also accepts .dts/.dtsi/.dtso files directly (with a
tab-indent rule) so it can be reused for actual device tree sources.
It reads file paths from @argfile and parallelises across CPUs, with
$PARALLELISM (set by scripts/jobserver-exec) honoured so the worker
count tracks `make -j N`. ruamel.yaml is the only non-stdlib
dependency, already required by dtschema.

In aggregate, strict mode pins down indentation, blank lines,
property and child ordering, hex casing, unit-address format,
whitespace inside <...>, line length (80 cols), continuation
alignment, closing brace placement and unused labels -- enough to
drive a single canonical layout per DT structure modulo the
author's choice of when to wrap properties for readability.

Strict-mode violation counts on a current tree (5506 YAML bindings,
6530 in-tree .dts/.dtsi/.dtso under arch/):

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

 Documentation/devicetree/bindings/Makefile    |   20 +-
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
 40 files changed, 1770 insertions(+), 2 deletions(-)
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

