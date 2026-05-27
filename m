Return-Path: <linux-kbuild+bounces-13373-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CExHHtNGF2qS/QcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13373-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 21:32:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CBD5E9839
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 21:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1E353019155
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 19:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DB737B014;
	Wed, 27 May 2026 19:32:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE0279903;
	Wed, 27 May 2026 19:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779910351; cv=none; b=uvmQgNsHtA5kZ5pStSI5jPgRZjunnHSkcZPyALJ5oFIZdxKeQquO3HYqQimdX1c2bLph9wl3Y+9njBK9LOveF4IJFifMrwAOc6uAlMAXIlEP4aecIVqAf+APE3kcD5cgJytdlsvsfJf0aGYqjrviSMw2zP1cj5DM/rYCjNnIjdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779910351; c=relaxed/simple;
	bh=fNXa6HUKvfW3gJbYetVlLiXJC+0jslklWoFtiIPSv1U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HKeGgb8uHux3KTHDsFTdrDxoXGpFzsXqzHrN9dyLaEkaUveSxqqDzyRWrOyc3GZLi8jLFsKfFNQGqNVIRHjcxj6lEu5VgwT7Z8UXRi72fuOHqKiDCugOCc/rnAIdMoz9CRTrsioLejXH9UryH9sorUQn+ZmqX0Zz6TxmPYbwYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wSJz0-000000003gr-426j;
	Wed, 27 May 2026 19:32:03 +0000
Date: Wed, 27 May 2026 20:31:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Sterba <dsterba@suse.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Filipe Manana <fdmanana@suse.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Chih-Kang Chang <gary.chang@realtek.com>,
	David Lechner <dlechner@baylibre.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>, Boris Burkov <boris@bur.io>,
	Blake Jones <blakejones@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 0/4] dt-bindings: automated coding style check for DTS
 examples
Message-ID: <cover.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13373-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[makrotopia.org];
	FREEMAIL_TO(0.00)[kernel.org,realtek.com,linux.intel.com,suse.com,linaro.org,quicinc.com,oss.qualcomm.com,gmail.com,suse.de,amd.com,baylibre.com,makrotopia.org,garyguo.net,weissschuh.net,intel.com,roeck-us.net,wp.pl,bur.io,google.com,lwn.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild,dt,huawei];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C7CBD5E9839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
examples, mixed tab+space indents, unclosed /* block comments,
and the per-input-type indent character (1 tab for
.dts/.dtsi/.dtso). It is zero-violation on the current tree and
runs as part of dt_binding_check_one, so no new warnings appear
in `make dt_binding_check`.

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
addresses; no whitespace padding inside <...>; closing-brace
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
v3: https://lore.kernel.org/all/cover.1778454442.git.daniel@makrotopia.org/
v4: https://lore.kernel.org/all/cover.1779472837.git.daniel@makrotopia.org/

Changes since v4:
 - dt-check-style: parser robustness fixes from a sashiko.dev
   AI review (multi-line CPP macros, "/* ... */ code" on one
   line, "}; };" depth tracking, malformed unit addresses,
   labels inside strings and on digit-leading node names,
   unclosed /* on PROPERTY lines)
 - dt-check-style: new relaxed-mode rule unclosed-block-comment
 - new patch: scripts/jobserver-exec propagates child exit
   status (prereq so chk_style errors stay reported)
 - selftest: add fixtures covering the parser fixes
 - selftest: move SPDX header to "// SPDX-..." on line 1 in
   the three .dts fixtures (checkpatch)

Changes since v3:
 - dt-check-style: accept node and property names that begin
   with a digit (the DT spec permits names like 1wire@10)
 - dt-check-style: strip trailing // and /* */ comments before
   line classification, so a trailing comment on a node-open or
   property line no longer causes misclassification
 - dt-check-style: continuation-alignment compares display
   columns (tabs expanded to 8) instead of raw string length,
   removing many false positives on tab-indented .dts files
 - dt-check-style: value-whitespace flags only whitespace directly
   inside the brackets (after '<', before '>'), on single- and
   multi-line cell lists; it no longer flags inter-value spacing,
   which is often deliberate column alignment
 - Makefile: build the @argfile with mktemp and remove it, so no
   stale .tmp_.dt-style.checked is left in the build tree
 - run.sh: drop bash-only process substitution (POSIX sh now)
   and check the checker's exit status
 - selftest: add fixtures for the above (digit-leading nodes,
   trailing comments, multi-line cell arrays, tab+space aligned
   continuations) and update yaml-value-ws for the reworked
   value-whitespace rule

Changes since v2:
 - route findings to stderr so a quiet dt_binding_check produces
   no output (Rob)
 - switch the Makefile recipe from mktemp to Kbuild's
   $(tmp-target) so build output stays inside the build folder
   (Nathan)
 - collapse the recipe's exit-handling tail into the familiar
   "&& touch $@ || true" pattern, matching cmd_chk_bindings;
   keeps future warnings non-fatal (Rob, Nathan)
 - explain in patch 3/4 why the recipe uses an explicit
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

Default relaxed mode is zero-violation on the current tree.

Strict-mode violation counts on a current tree (5506 YAML
bindings, 6530 in-tree .dts/.dtsi/.dtso under arch/):

  rule                     yaml      dts
  property-order          14554   245000
  continuation-alignment   1857    93536
  indent-consistent        1562    48720
  required-blank-lines     1876    48563
  line-length               105    26322
  child-name-order          667    16821
  mixed-indent-chars          0    13294
  unused-labels            3611    11628
  child-address-order        63     4076
  blank-lines                82     1866
  node-close-alone           38      774
  value-whitespace           38      715
  hex-case                   78      669
  indent-unit-dts            --      190
  unit-address-format         5       39
  trailing-whitespace         0       10
  indent-unit-strict       1492       --
  indent-unit               179       --

(YAML and DTS columns reflect the rules that apply to each input
type; e.g. indent-unit-strict is YAML-only since .dts files use
tabs, indent-unit-dts is the equivalent DTS-only check.
unused-labels is skipped for .dtsi/.dtso since labels there are
exported to includers/applies-to.)

The script was written with generous help from Claude Opus 4.7,
since my Python is even worse than my DTS coding style.

Daniel Golle (4):
  dt-bindings: add DTS style checker
  scripts/jobserver-exec: propagate child exit status
  dt-bindings: wire style checker into dt_binding_check
  dt-bindings: add self-test fixtures for style checker

 Documentation/devicetree/bindings/Makefile    |   19 +-
 Makefile                                      |    6 +
 scripts/dtc/dt-check-style                    | 1192 +++++++++++++++++
 .../dtc/dt-style-selftest/bad/dts-spaces.dts  |   12 +
 .../bad/yaml-child-addr-order.yaml            |   41 +
 .../bad/yaml-child-name-order.yaml            |   37 +
 .../bad/yaml-cont-align.yaml                  |   30 +
 .../bad/yaml-digit-node-order.yaml            |   37 +
 .../dt-style-selftest/bad/yaml-hex-case.yaml  |   29 +
 .../bad/yaml-indent-strict.yaml               |   29 +
 .../bad/yaml-label-in-string.yaml             |   30 +
 .../bad/yaml-line-length.yaml                 |   29 +
 .../bad/yaml-mixed-indent.yaml                |   29 +
 .../bad/yaml-multi-close.yaml                 |   35 +
 .../bad/yaml-node-close.yaml                  |   31 +
 .../bad/yaml-prop-order.yaml                  |   29 +
 .../bad/yaml-prop-pairing.yaml                |   33 +
 .../bad/yaml-required-blank.yaml              |   33 +
 .../dtc/dt-style-selftest/bad/yaml-tab.yaml   |   29 +
 .../bad/yaml-trailing-comment.yaml            |   26 +
 .../bad/yaml-trailing-ws.yaml                 |   29 +
 .../bad/yaml-unclosed-comment.yaml            |   30 +
 .../bad/yaml-unit-addr-prefix.yaml            |   29 +
 .../dt-style-selftest/bad/yaml-unit-addr.yaml |   29 +
 .../bad/yaml-unused-label.yaml                |   29 +
 .../bad/yaml-value-ws-multiline.yaml          |   27 +
 .../dt-style-selftest/bad/yaml-value-ws.yaml  |   29 +
 .../expected/dts-spaces.dts.txt               |    2 +
 .../expected/yaml-child-addr-order.yaml.txt   |    2 +
 .../expected/yaml-child-name-order.yaml.txt   |    2 +
 .../expected/yaml-cont-align.yaml.txt         |    2 +
 .../expected/yaml-digit-node-order.yaml.txt   |    2 +
 .../expected/yaml-hex-case.yaml.txt           |    2 +
 .../expected/yaml-indent-strict.yaml.txt      |    2 +
 .../expected/yaml-label-in-string.yaml.txt    |    2 +
 .../expected/yaml-line-length.yaml.txt        |    2 +
 .../expected/yaml-mixed-indent.yaml.txt       |    3 +
 .../expected/yaml-multi-close.yaml.txt        |    3 +
 .../expected/yaml-node-close.yaml.txt         |    2 +
 .../expected/yaml-prop-order.yaml.txt         |    2 +
 .../expected/yaml-prop-pairing.yaml.txt       |    3 +
 .../expected/yaml-required-blank.yaml.txt     |    3 +
 .../expected/yaml-tab.yaml.txt                |    2 +
 .../expected/yaml-trailing-comment.yaml.txt   |    2 +
 .../expected/yaml-trailing-ws.yaml.txt        |    2 +
 .../expected/yaml-unclosed-comment.yaml.txt   |    2 +
 .../expected/yaml-unit-addr-prefix.yaml.txt   |    2 +
 .../expected/yaml-unit-addr.yaml.txt          |    2 +
 .../expected/yaml-unused-label.yaml.txt       |    2 +
 .../expected/yaml-value-ws-multiline.yaml.txt |    2 +
 .../expected/yaml-value-ws.yaml.txt           |    2 +
 .../dt-style-selftest/good/dts-cont-align.dts |   26 +
 .../dtc/dt-style-selftest/good/dts-tab.dts    |   29 +
 .../dt-style-selftest/good/yaml-4space.yaml   |   41 +
 .../good/yaml-tricky-parsing.yaml             |   57 +
 scripts/dtc/dt-style-selftest/run.sh          |   71 +
 scripts/jobserver-exec                        |    4 +-
 57 files changed, 2214 insertions(+), 4 deletions(-)
 create mode 100755 scripts/dtc/dt-check-style
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-spaces.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-addr-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-child-name-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-digit-node-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-hex-case.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-label-in-string.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-multi-close.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-node-close.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-required-blank.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-trailing-comment.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-trailing-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unclosed-comment.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unit-addr-prefix.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unit-addr.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-unused-label.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-value-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-tab.dts
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
 create mode 100755 scripts/dtc/dt-style-selftest/run.sh

-- 
2.54.0

