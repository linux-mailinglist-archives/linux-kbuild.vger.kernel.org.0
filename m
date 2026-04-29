Return-Path: <linux-kbuild+bounces-12931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGpMDlQV8mljnwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12931-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 16:27:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B01495B55
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 16:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70A5E302A9F7
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 14:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1B03368AF;
	Wed, 29 Apr 2026 14:21:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BF232FA2E;
	Wed, 29 Apr 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472509; cv=none; b=Exb9Oaw6mMasof0Zp+4JKE9ikg+BJiLKYrn6Axt5D4GD/+Wxm1Wytvee3h4qZbR0BTUg8Lp7Q2PF3QALRP6d1JLJs2RzGNCAQLbAf51ybzulhq2tRJX+ZENhZE+sOQGTNd+/5qErUZY9xxFE08PuZw0BH4fOX6PidnhR6Lvw2mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472509; c=relaxed/simple;
	bh=BnNZh8AlPMP2gVoG/iZAirONpL2QM5tcKsY0Sj53vV8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ra367URS3oZmpPNqoxRfQ7m11GJqe7trug0M5sOjfyzCfQ7pSC5PDjwdI0U1gTaih4fhLn06EUG6mheZJ75sGlCVQbZOzyZrEeQyJCcEwDApjJrmew4u4ZlDjh+eS6rOJ7YBrlV4ipLl9OT2TEmt0GixoqpA9ukQgZdqO4rh8Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wI5n5-000000002RP-360g;
	Wed, 29 Apr 2026 14:21:27 +0000
Date: Wed, 29 Apr 2026 15:21:24 +0100
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
Subject: [PATCH v2 1/3] dt-bindings: add DTS style checker
Message-ID: <0df091db9fde4095eab6957b9158663997b0a639.1777471439.git.daniel@makrotopia.org>
References: <cover.1777471439.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777471439.git.daniel@makrotopia.org>
X-Rspamd-Queue-Id: 17B01495B55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12931-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[makrotopia.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,makrotopia.org,weissschuh.net,goodmis.org,roeck-us.net,wp.pl,example.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.148];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]

Add a Python tool that checks DTS coding style on examples in YAML
binding files and on .dts/.dtsi/.dtso source files. Rules are kept in
a small declarative registry, each tagged 'relaxed' (default; must be
zero-violation on the current tree) or 'strict' (opt-in for new
submissions). Promoting a rule from strict to relaxed is a one-line
edit once the tree is clean.

Relaxed mode covers trailing whitespace, tab characters in YAML
examples, mixed tab+space indents, and the per-input-type indent
character (1 tab for .dts/.dtsi/.dtso). Strict mode adds:

  - indent unit and depth consistency (4 spaces for YAML, 1 tab for
    DTS) plus a stricter YAML variant requiring exactly 4 spaces;
  - blank-line policy: no consecutive blanks or blanks at body
    edges; required blank line before each child node and before
    "status";
  - property ordering by canonical bucket (compatible, reg/reg-names,
    ranges, standard, vendor, status) with declarative within-bucket
    pairing rules (<x>-names follows <x>, pinctrl-names follows the
    last pinctrl-N) and natural-sort fallback;
  - sibling node ordering: by unit address when present, by natural-
    sort node name otherwise;
  - line length capped at 80 columns;
  - continuation alignment of multi-line property values under the
    first '<' or '"' after the '=' sign;
  - hex literals lowercase; unit addresses lowercase hex without
    leading zeros; single-spaced values inside <...>; closing brace
    on its own line;
  - unused-label detection (skipped for .dtsi/.dtso since labels
    there are exported to includers/applies-to).

Together these constrain a DT structure to a single canonical
rendering, modulo the author's choice of when to wrap a property
across lines for readability, and not covering comments.

The tool reads file paths from @argfile and parallelises across CPUs
via -j N. With no -j given it picks up $PARALLELISM (set by
scripts/jobserver-exec from the GNU make jobserver) and falls back to
os.cpu_count() otherwise. Running as one Python invocation amortises
the ruamel.yaml import across the whole tree -- ~2s on a 32-CPU host
vs ~28s sequential.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
 - renamed dt-check-example-style -> dt-check-style; tool now also
   accepts .dts/.dtsi/.dtso files directly (tab-indent variant) and
   distinguishes .dts/.dtsi/.dtso so unused-labels skips .dtsi/.dtso
   where labels are exported to includers/applies-to
 - rules declared in a registry tagged relaxed/strict; default
   relaxed mode is zero-violation on the current tree
 - added -j N with $PARALLELISM (jobserver) awareness
 - dropped node-name [a-z0-9-] check (Rob: better as a meta-schema)
 - property-order rebuilt around buckets + declarative pairing rules
   (<x>-names after <x>, pinctrl-names after last pinctrl-N) plus
   natural-sort fallback
 - added child-name-order, required-blank-lines, hex-case,
   unit-address-format, value-whitespace, node-close-alone,
   line-length and continuation-alignment to strict mode

 scripts/dtc/dt-check-style | 1063 ++++++++++++++++++++++++++++++++++++
 1 file changed, 1063 insertions(+)
 create mode 100755 scripts/dtc/dt-check-style

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
new file mode 100755
index 000000000000..477d3e427fc1
--- /dev/null
+++ b/scripts/dtc/dt-check-style
@@ -0,0 +1,1063 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Check DTS coding style on YAML binding examples and on
+# .dts/.dtsi/.dtso source files. Enforces rules from
+# Documentation/devicetree/bindings/dts-coding-style.rst.
+#
+# Two modes:
+#   --mode=relaxed (default)
+#     Only rules that produce zero warnings on the current tree.
+#     Suitable for dt_binding_check.
+#   --mode=strict
+#     All rules. Required for new submissions.
+#
+# Two input types (auto-detected by file extension):
+#   *.yaml             -- DT binding; check each example block
+#   *.dts/*.dtsi/*.dtso -- DTS source; whole file is one block
+#
+# Rules are declared in a registry (see RULES below); each rule is
+# tagged with the lowest mode that runs it. Promoting a rule from
+# 'strict' to 'relaxed' is a one-line change.
+
+import argparse
+import re
+import sys
+from enum import Enum, auto
+
+import ruamel.yaml
+
+
+# ---------------------------------------------------------------------------
+# Line classification
+# ---------------------------------------------------------------------------
+
+class LineType(Enum):
+    BLANK = auto()
+    COMMENT = auto()         # // ... or /* ... */ on one line
+    COMMENT_START = auto()   # /* without closing */
+    COMMENT_BODY = auto()    # inside a multi-line comment
+    COMMENT_END = auto()     # closing */
+    PREPROCESSOR = auto()    # #include / #define / #ifdef / ...
+    NODE_OPEN = auto()       # something { (with optional label/name/addr)
+    NODE_CLOSE = auto()      # };
+    PROPERTY = auto()        # name = value; or name;
+    CONTINUATION = auto()    # continuation of a multi-line property
+
+
+re_cpp_directive = re.compile(
+    r'^#\s*(include|define|undef|ifdef|ifndef|if|else|elif|endif|'
+    r'pragma|error|warning)\b')
+
+# label: name@addr {  -- label and addr optional; name can be "/"
+re_node_header = re.compile(
+    r'^(?:([a-zA-Z_][a-zA-Z0-9_]*):\s*)?'
+    r'([a-zA-Z][a-zA-Z0-9,._+-]*|/)'
+    r'(?:@([0-9a-fA-F,]+))?'
+    r'\s*\{$')
+
+re_ref_node = re.compile(
+    r'^&([a-zA-Z_][a-zA-Z0-9_]*)\s*\{$')
+
+
+def is_preprocessor(stripped):
+    """Tell C preprocessor directives apart from DTS '#'-prefixed props."""
+    return re_cpp_directive.match(stripped) is not None
+
+
+class DtsLine:
+    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped',
+                 'prop_name', 'continuations',
+                 'node_name', 'node_addr', 'label', 'ref_name', 'depth')
+
+    def __init__(self, lineno, raw, linetype, indent_str, stripped):
+        self.lineno = lineno      # 1-based within the block
+        self.raw = raw
+        self.linetype = linetype
+        self.indent_str = indent_str  # leading whitespace as-is
+        self.stripped = stripped
+        self.prop_name = None
+        self.continuations = []
+        self.node_name = None
+        self.node_addr = None
+        self.label = None
+        self.ref_name = None
+        self.depth = 0            # filled in by classify_lines
+
+
+def classify_lines(text):
+    """Return a list of DtsLine. Tracks { } depth and groups
+    continuation lines onto their leading PROPERTY line."""
+    out = []
+    in_block_comment = False
+    prev_complete = True
+    depth = 0
+
+    # Split preserving the indent string verbatim
+    re_lead = re.compile(r'^([ \t]*)(.*)$')
+
+    for i, raw in enumerate(text.split('\n'), start=1):
+        m = re_lead.match(raw)
+        indent_str = m.group(1)
+        stripped = m.group(2)
+
+        if not stripped:
+            dl = DtsLine(i, raw, LineType.BLANK, '', '')
+            dl.depth = depth
+            out.append(dl)
+            continue
+
+        if in_block_comment:
+            ltype = (LineType.COMMENT_END if '*/' in stripped
+                     else LineType.COMMENT_BODY)
+            if ltype == LineType.COMMENT_END:
+                in_block_comment = False
+            dl = DtsLine(i, raw, ltype, indent_str, stripped)
+            dl.depth = depth
+            out.append(dl)
+            continue
+
+        if stripped.startswith('/*'):
+            if '*/' in stripped:
+                ltype = LineType.COMMENT
+            else:
+                in_block_comment = True
+                ltype = LineType.COMMENT_START
+            dl = DtsLine(i, raw, ltype, indent_str, stripped)
+            dl.depth = depth
+            out.append(dl)
+            continue
+
+        if stripped.startswith('//'):
+            dl = DtsLine(i, raw, LineType.COMMENT, indent_str, stripped)
+            dl.depth = depth
+            out.append(dl)
+            continue
+
+        if stripped.startswith('#') and is_preprocessor(stripped):
+            dl = DtsLine(i, raw, LineType.PREPROCESSOR,
+                         indent_str, stripped)
+            dl.depth = depth
+            out.append(dl)
+            prev_complete = True
+            continue
+
+        if not prev_complete:
+            dl = DtsLine(i, raw, LineType.CONTINUATION,
+                         indent_str, stripped)
+            dl.depth = depth
+            out.append(dl)
+            prev_complete = (stripped.endswith(';') or
+                             stripped.endswith('{') or
+                             stripped.endswith('};'))
+            continue
+
+        if stripped == '};' or stripped == '}':
+            depth = max(depth - 1, 0)
+            dl = DtsLine(i, raw, LineType.NODE_CLOSE, indent_str, stripped)
+            dl.depth = depth
+            out.append(dl)
+            prev_complete = True
+            continue
+
+        if stripped.endswith('{'):
+            dl = DtsLine(i, raw, LineType.NODE_OPEN, indent_str, stripped)
+            parse_node_header(dl)
+            dl.depth = depth
+            out.append(dl)
+            depth += 1
+            prev_complete = True
+            continue
+
+        # Property (or first line of a multi-line property).
+        dl = DtsLine(i, raw, LineType.PROPERTY, indent_str, stripped)
+        parse_property_name(dl)
+        dl.depth = depth
+        out.append(dl)
+        prev_complete = stripped.endswith(';')
+
+    # Group continuation lines onto their leading PROPERTY.
+    last_prop = None
+    grouped = []
+    for dl in out:
+        if dl.linetype == LineType.CONTINUATION and last_prop is not None:
+            last_prop.continuations.append(dl)
+            continue
+        if dl.linetype == LineType.PROPERTY:
+            last_prop = dl
+        elif dl.linetype != LineType.BLANK and \
+                dl.linetype not in (LineType.COMMENT, LineType.COMMENT_BODY,
+                                    LineType.COMMENT_END,
+                                    LineType.COMMENT_START):
+            last_prop = None
+        grouped.append(dl)
+    return grouped
+
+
+def parse_node_header(dl):
+    m = re_node_header.match(dl.stripped)
+    if m:
+        dl.label = m.group(1)
+        dl.node_name = m.group(2)
+        dl.node_addr = m.group(3)
+        return
+    m = re_ref_node.match(dl.stripped)
+    if m:
+        dl.ref_name = m.group(1)
+
+
+def parse_property_name(dl):
+    m = re.match(r'^([a-zA-Z#][a-zA-Z0-9,._+#-]*)\s*[=;]', dl.stripped)
+    if m:
+        dl.prop_name = m.group(1)
+
+
+def collect_labels_and_refs(text):
+    """Return (defined_labels, referenced_labels) found anywhere outside
+    /* */ comments. Labels named fake_intc* (injected by
+    dt-extract-example) are skipped."""
+    # Strip block comments first so labels inside them don't count
+    stripped = re.sub(r'/\*.*?\*/', '', text, flags=re.DOTALL)
+    # Strip line comments
+    stripped = re.sub(r'//[^\n]*', '', stripped)
+    defined = set()
+    referenced = set()
+    for m in re.finditer(r'(?:^|[\s{])([a-zA-Z_][a-zA-Z0-9_]*):\s*[a-zA-Z/&]',
+                         stripped):
+        name = m.group(1)
+        if not name.startswith('fake_intc'):
+            defined.add(name)
+    for m in re.finditer(r'&([a-zA-Z_][a-zA-Z0-9_]*)', stripped):
+        referenced.add(m.group(1))
+    return defined, referenced
+
+
+# ---------------------------------------------------------------------------
+# Rule registry
+# ---------------------------------------------------------------------------
+
+class Ctx:
+    """Context passed to each rule check. Carries the parsed lines,
+    raw text, mode, and indent kind."""
+
+    def __init__(self, lines, text, mode, indent_kind):
+        self.lines = lines
+        self.text = text
+        self.mode = mode               # 'relaxed' or 'strict'
+        self.indent_kind = indent_kind  # 'spaces' or 'tab'
+
+
+class Rule:
+    __slots__ = ('name', 'mode', 'description', 'check', 'applies_to')
+
+    def __init__(self, name, mode, description, check,
+                 applies_to=('yaml', 'dts', 'dtsi', 'dtso')):
+        self.name = name
+        self.mode = mode               # 'relaxed' or 'strict'
+        self.description = description
+        self.check = check
+        self.applies_to = applies_to   # input types this rule covers
+
+
+# --- individual rule check functions --------------------------------------
+
+def check_trailing_whitespace(ctx):
+    for dl in ctx.lines:
+        if dl.raw != dl.raw.rstrip():
+            yield (dl.lineno, 'trailing whitespace')
+
+
+def check_tab_in_dts(ctx):
+    """Reject literal tabs in DTS lines when input is YAML.
+
+    For YAML examples, indent and content must use spaces. Tabs inside
+    a #define value are tolerated (those are CPP macros, not DTS).
+    For .dts files, this rule does not apply -- tabs are required.
+    """
+    if ctx.indent_kind != 'spaces':
+        return
+    for dl in ctx.lines:
+        if dl.linetype == LineType.PREPROCESSOR:
+            continue
+        if dl.linetype == LineType.BLANK:
+            continue
+        if '\t' in dl.raw:
+            yield (dl.lineno, 'tab character not allowed in DTS example')
+
+
+def check_mixed_indent_chars(ctx):
+    """Indent must be all-spaces or all-tabs, never mixed on one line."""
+    for dl in ctx.lines:
+        if not dl.indent_str:
+            continue
+        if dl.linetype == LineType.PREPROCESSOR:
+            continue
+        if ' ' in dl.indent_str and '\t' in dl.indent_str:
+            yield (dl.lineno, 'mixed tabs and spaces in indent')
+
+
+def detect_indent_unit(ctx):
+    """Find the indent unit used at depth 1 in this block.
+
+    Returns one of: '  ' (2 spaces), '    ' (4 spaces), '\\t' (tab),
+    or None if depth-1 is empty or ambiguous."""
+    for dl in ctx.lines:
+        if dl.depth != 1:
+            continue
+        if dl.linetype in (LineType.BLANK, LineType.PREPROCESSOR):
+            continue
+        if dl.linetype in (LineType.COMMENT_BODY, LineType.COMMENT_END):
+            continue
+        if not dl.indent_str:
+            continue
+        if dl.indent_str == '\t':
+            return '\t'
+        if dl.indent_str == '    ':
+            return '    '
+        if dl.indent_str == '  ':
+            return '  '
+        # Anything else at depth 1 is non-canonical; flag elsewhere.
+        return dl.indent_str
+    return None
+
+
+def check_indent_unit_relaxed(ctx):
+    """YAML examples: 2 or 4 spaces. Never tabs or other widths."""
+    unit = detect_indent_unit(ctx)
+    if unit is None:
+        return
+    if unit not in ('  ', '    '):
+        yield (1, 'indent unit must be 2 or 4 spaces, got %r' % unit)
+
+
+def check_indent_unit_dts(ctx):
+    """DTS files: 1 tab per level. Always required."""
+    unit = detect_indent_unit(ctx)
+    if unit is None:
+        return
+    if unit != '\t':
+        yield (1, 'indent unit must be 1 tab in DTS, got %r' % unit)
+
+
+def check_indent_unit_strict(ctx):
+    """YAML: must be exactly 4 spaces. DTS: 1 tab (same as relaxed)."""
+    unit = detect_indent_unit(ctx)
+    if unit is None:
+        return
+    if ctx.indent_kind == 'spaces':
+        if unit != '    ':
+            yield (1, 'indent unit must be 4 spaces in strict mode, '
+                   'got %r' % unit)
+
+
+def check_indent_consistent(ctx):
+    """All indented lines must be a multiple of the detected unit."""
+    unit = detect_indent_unit(ctx)
+    if unit is None:
+        return
+    if ctx.indent_kind == 'spaces':
+        if unit not in ('  ', '    '):
+            return  # let check_indent_unit_* report this
+    else:
+        if unit != '\t':
+            return
+
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.BLANK, LineType.PREPROCESSOR):
+            continue
+        if dl.linetype == LineType.CONTINUATION:
+            continue   # continuations align to <, not to indent unit
+        if dl.linetype in (LineType.COMMENT_BODY, LineType.COMMENT_END):
+            continue
+        if not dl.indent_str:
+            continue
+        # The indent must be 'unit' repeated dl.depth times, exactly.
+        # NODE_CLOSE lines have depth equal to the post-decrement value,
+        # which matches the indent expected.
+        expected = unit * dl.depth
+        if dl.indent_str != expected:
+            yield (dl.lineno,
+                   'indent mismatch (expected depth %d * %r)' %
+                   (dl.depth, unit))
+
+
+def check_blank_lines(ctx):
+    """No two consecutive blank lines, no leading/trailing blank lines
+    in any node body."""
+    lines = ctx.lines
+    # Consecutive blanks
+    for i in range(1, len(lines)):
+        if lines[i].linetype == LineType.BLANK and \
+                lines[i - 1].linetype == LineType.BLANK:
+            yield (lines[i].lineno, 'consecutive blank lines')
+    # Blank right after { or right before }
+    for i, dl in enumerate(lines):
+        if dl.linetype != LineType.BLANK:
+            continue
+        prev = lines[i - 1] if i > 0 else None
+        nxt = lines[i + 1] if i + 1 < len(lines) else None
+        if prev is not None and prev.linetype == LineType.NODE_OPEN:
+            yield (dl.lineno, 'blank line at start of node body')
+        if nxt is not None and nxt.linetype == LineType.NODE_CLOSE:
+            yield (dl.lineno, 'blank line at end of node body')
+
+
+def _walk_bodies(lines):
+    """Yield lists of immediate-child NODE_OPEN lines for each node body
+    in the input. Skips ref-nodes (&label) since those don't have an
+    intrinsic ordering."""
+    body_stack = [[]]
+    for dl in lines:
+        if dl.linetype == LineType.NODE_OPEN:
+            body_stack[-1].append(dl)
+            body_stack.append([])
+            continue
+        if dl.linetype == LineType.NODE_CLOSE:
+            if len(body_stack) <= 1:
+                # Unbalanced; ignore to avoid crashing on malformed input
+                continue
+            yield body_stack.pop()
+            continue
+    while body_stack:
+        yield body_stack.pop()
+
+
+def _natural_sort_key(s):
+    """Split a string into a tuple of (kind, value) pairs that compares
+    numeric runs as ints, so 'foo10' sorts after 'foo2'."""
+    parts = []
+    for part in re.split(r'(\d+)', s):
+        if part.isdigit():
+            parts.append((0, int(part)))
+        else:
+            parts.append((1, part))
+    return tuple(parts)
+
+
+def check_child_address_order(ctx):
+    """Addressed siblings (foo@N) must appear in ascending address
+    order within their parent node body."""
+    for children in _walk_bodies(ctx.lines):
+        addressed = []
+        for c in children:
+            if c.node_addr is None:
+                continue
+            try:
+                parts = tuple(int(p, 16) for p in c.node_addr.split(','))
+            except ValueError:
+                continue
+            addressed.append((parts, c))
+        for i in range(1, len(addressed)):
+            if addressed[i][0] < addressed[i - 1][0]:
+                dl = addressed[i][1]
+                yield (dl.lineno,
+                       'child node @%s out of address order' %
+                       dl.node_addr)
+
+
+def check_child_name_order(ctx):
+    """Unaddressed siblings must appear in natural-sort order by node
+    name within their parent node body. Addressed children are scoped
+    by check_child_address_order; reference nodes (&label { ... }) and
+    the root node are skipped."""
+    for children in _walk_bodies(ctx.lines):
+        unaddressed = []
+        for c in children:
+            if c.node_addr is not None:
+                continue
+            if c.node_name in (None, '/'):
+                continue
+            if c.ref_name is not None:
+                continue
+            unaddressed.append((_natural_sort_key(c.node_name), c))
+        for i in range(1, len(unaddressed)):
+            if unaddressed[i][0] < unaddressed[i - 1][0]:
+                dl = unaddressed[i][1]
+                yield (dl.lineno,
+                       'child node %r out of name order' % dl.node_name)
+
+
+def _property_bucket(name):
+    """Return the canonical bucket index for a property:
+       0 compatible
+       1 reg / reg-names
+       2 ranges
+       3 standard properties (no vendor comma in #-stripped name)
+       4 vendor-specific properties
+       5 status
+    Plus a sub-key inside the bucket for fixed slots (compatible, reg,
+    reg-names, ranges, status). 'standard' and 'vendor' return None for
+    the sub-key, signalling that the within-bucket key is computed by
+    the pairing rules."""
+    stripped = name.lstrip('#')
+    if name == 'compatible':
+        return (0, 0)
+    if name == 'reg':
+        return (1, 0)
+    if name == 'reg-names':
+        return (1, 1)
+    if name == 'ranges':
+        return (2, 0)
+    if name == 'status':
+        return (5, 0)
+    return (4 if ',' in stripped else 3, None)
+
+
+# Declarative pairing rules: each is a callable
+#   (name, all_names) -> anchor_name_or_None
+# If a rule returns an anchor, the property sorts immediately after the
+# anchor. Rules are tried in order; the first match wins. If none
+# matches, the within-bucket key falls back to natural sort by the
+# #-stripped name.
+
+def _pair_pinctrl_names(name, all_names):
+    """pinctrl-names follows the highest pinctrl-N in the same node."""
+    if name != 'pinctrl-names':
+        return None
+    cands = [n for n in all_names if re.match(r'^pinctrl-\d+$', n)]
+    if not cands:
+        return None
+    return max(cands, key=_natural_sort_key)
+
+
+def _pair_x_names(name, all_names):
+    """Generic <x>-names follows its owning property. The owner is
+    usually plural (clocks/clock-names, dmas/dma-names,
+    resets/reset-names) but occasionally singular (reg/reg-names is
+    handled by the fixed slot above; this rule catches anything else)."""
+    if not name.endswith('-names'):
+        return None
+    base = name[:-len('-names')]
+    # Try plural and singular forms.
+    if (base + 's') in all_names:
+        return base + 's'
+    if base in all_names:
+        return base
+    return None
+
+
+PAIRING_RULES = (_pair_pinctrl_names, _pair_x_names)
+
+
+def _property_sort_key(name, all_names):
+    """Sort key for a property among its node-body siblings.
+
+    Format: (bucket, within_key, tiebreak). 'within_key' for
+    standard/vendor buckets follows pairing rules: a property paired
+    with anchor X sorts as if it were X with a higher tiebreak."""
+    bucket, fixed_sub = _property_bucket(name)
+    if fixed_sub is not None:
+        return (bucket, (), fixed_sub)
+
+    for rule in PAIRING_RULES:
+        anchor = rule(name, all_names)
+        if anchor is not None:
+            return (bucket, _natural_sort_key(anchor.lstrip('#')), 1)
+
+    return (bucket, _natural_sort_key(name.lstrip('#')), 0)
+
+
+def check_property_order(ctx):
+    """Properties within a node body must appear in canonical order:
+    compatible, reg(/reg-names), ranges, then the standard group, then
+    the vendor-specific group, then status. Inside the standard and
+    vendor groups, pairing rules apply (e.g. <x>-names follows <x>);
+    everything else falls back to natural sort by the #-stripped name."""
+    lines = ctx.lines
+    for i, dl in enumerate(lines):
+        if dl.linetype != LineType.NODE_OPEN:
+            continue
+        body_depth = dl.depth + 1
+        props = []
+        for j in range(i + 1, len(lines)):
+            d = lines[j]
+            if d.linetype == LineType.NODE_CLOSE and \
+                    d.depth == body_depth - 1:
+                break
+            if d.linetype == LineType.PROPERTY and d.depth == body_depth \
+                    and d.prop_name is not None:
+                props.append(d)
+        if len(props) < 2:
+            continue
+        all_names = [p.prop_name for p in props]
+        keyed = [(p, _property_sort_key(p.prop_name, all_names))
+                 for p in props]
+        for k in range(1, len(keyed)):
+            if keyed[k][1] < keyed[k - 1][1]:
+                p = keyed[k][0]
+                prev = keyed[k - 1][0]
+                yield (p.lineno,
+                       'property %r out of canonical order '
+                       '(should sort before %r)' %
+                       (p.prop_name, prev.prop_name))
+
+
+def _strip_strings_and_comments(text):
+    """Remove string literals and /* */ + // comments from a single
+    line, replacing them with empty strings. Used so syntactic checks
+    (whitespace, hex case, etc.) don't false-positive on contents of
+    quoted strings or comments."""
+    text = re.sub(r'"(?:[^"\\]|\\.)*"', '""', text)
+    text = re.sub(r'/\*.*?\*/', '', text)
+    text = re.sub(r'//.*$', '', text)
+    return text
+
+
+def check_required_blank_lines(ctx):
+    """A blank line must precede each child node and the 'status'
+    property within a node body, except when these are the first
+    substantive item in the body."""
+    lines = ctx.lines
+    for i, open_dl in enumerate(lines):
+        if open_dl.linetype != LineType.NODE_OPEN:
+            continue
+        body_depth = open_dl.depth + 1
+        prev_substantive = None
+        between_blanks = 0
+        depth_inside = 0
+        for j in range(i + 1, len(lines)):
+            d = lines[j]
+            if d.linetype == LineType.NODE_CLOSE and \
+                    d.depth == body_depth - 1 and depth_inside == 0:
+                break
+            # Track depth inside nested children so we only look at
+            # immediate-body items.
+            if d.linetype == LineType.NODE_OPEN and \
+                    d.depth >= body_depth and depth_inside > 0:
+                depth_inside += 1
+                continue
+            if d.linetype == LineType.NODE_CLOSE and depth_inside > 0:
+                depth_inside -= 1
+                continue
+            if depth_inside > 0:
+                continue
+            if d.linetype == LineType.BLANK:
+                if prev_substantive is not None:
+                    between_blanks += 1
+                continue
+            if d.linetype in (LineType.COMMENT, LineType.COMMENT_START,
+                              LineType.COMMENT_BODY, LineType.COMMENT_END,
+                              LineType.PREPROCESSOR):
+                continue
+            if d.linetype == LineType.CONTINUATION:
+                continue
+
+            needs_blank = False
+            if d.linetype == LineType.NODE_OPEN:
+                needs_blank = True
+                depth_inside = 1   # entered the child body
+            elif d.linetype == LineType.PROPERTY and d.prop_name == 'status':
+                needs_blank = True
+
+            if needs_blank and prev_substantive is not None and \
+                    between_blanks == 0:
+                if d.linetype == LineType.NODE_OPEN:
+                    yield (d.lineno,
+                           'child node must be preceded by a blank line')
+                else:
+                    yield (d.lineno,
+                           '"status" must be preceded by a blank line')
+
+            prev_substantive = d
+            between_blanks = 0
+
+
+def check_hex_case(ctx):
+    """Hex literals (0xN) must use lowercase digits and prefix."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
+                           LineType.COMMENT_START, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.PREPROCESSOR):
+            continue
+        text = _strip_strings_and_comments(dl.raw)
+        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', text):
+            lit = m.group(0)
+            if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
+                yield (dl.lineno,
+                       'hex literal %r must be lowercase' % lit)
+
+
+def check_unit_address_format(ctx):
+    """Unit addresses must be lowercase hex without leading zeros.
+    For multi-cell addresses (comma-separated), each part is checked
+    independently. A single '0' is permitted (canonical zero)."""
+    for dl in ctx.lines:
+        if dl.linetype != LineType.NODE_OPEN:
+            continue
+        if dl.node_addr is None:
+            continue
+        addr = dl.node_addr
+        for part in addr.split(','):
+            if any(c in 'ABCDEF' for c in part):
+                yield (dl.lineno,
+                       'unit address %r must be lowercase hex' % addr)
+                break
+            if len(part) > 1 and part.startswith('0'):
+                yield (dl.lineno,
+                       'unit address %r has leading zeros' % addr)
+                break
+
+
+def check_value_whitespace(ctx):
+    """Inside a <...> cell list use single spaces between values; no
+    leading or trailing whitespace inside the brackets. Outside
+    strings and comments only."""
+    for dl in ctx.lines:
+        if dl.linetype not in (LineType.PROPERTY, LineType.CONTINUATION):
+            continue
+        text = _strip_strings_and_comments(dl.raw)
+        for m in re.finditer(r'<([^<>]*)>', text):
+            content = m.group(1)
+            if content != content.strip():
+                yield (dl.lineno,
+                       'extra whitespace inside <...>')
+                break
+            if re.search(r'[ \t]{2,}', content):
+                yield (dl.lineno,
+                       'multiple spaces inside <...>')
+                break
+
+
+def check_node_close_alone(ctx):
+    """The closing '};' of a node must be on its own line. The
+    classifier already accepts only `};` or `}` as NODE_CLOSE; any
+    other line that still contains `};` (in code, not in strings or
+    comments) is mixing a node close with something else."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.BLANK, LineType.COMMENT,
+                           LineType.COMMENT_START, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.PREPROCESSOR,
+                           LineType.NODE_CLOSE):
+            continue
+        text = _strip_strings_and_comments(dl.raw)
+        if '};' in text:
+            yield (dl.lineno,
+                   'closing brace must be on its own line')
+
+
+def check_line_length(ctx):
+    """Lines must not exceed 80 characters. Trailing newlines do not
+    count. Tabs in DTS files are counted as 8 columns to match how
+    `printf` and most editors render them, matching the kernel-wide
+    line length convention."""
+    for dl in ctx.lines:
+        if dl.linetype == LineType.BLANK:
+            continue
+        # Compute display width: tabs count as 8 columns, advancing to
+        # the next multiple of 8.
+        cols = 0
+        for ch in dl.raw:
+            if ch == '\t':
+                cols = (cols // 8 + 1) * 8
+            else:
+                cols += 1
+        if cols > 80:
+            yield (dl.lineno,
+                   'line exceeds 80 columns (%d)' % cols)
+
+
+def check_continuation_alignment(ctx):
+    """A multi-line property's continuation lines must align their
+    first non-whitespace character to the column of the first '<' or
+    '"' after the '=' in the leading line."""
+    for dl in ctx.lines:
+        if dl.linetype != LineType.PROPERTY:
+            continue
+        if not dl.continuations:
+            continue
+        eq = dl.raw.find('=')
+        if eq < 0:
+            continue
+        # First '<' or '"' after '='
+        rest = dl.raw[eq + 1:]
+        m = re.search(r'[<"]', rest)
+        if not m:
+            continue
+        target_col = eq + 1 + m.start()
+        for cont in dl.continuations:
+            if len(cont.indent_str) != target_col:
+                yield (cont.lineno,
+                       'continuation should align to column %d '
+                       '(under "<" or \\")' % (target_col + 1))
+
+
+def check_unused_labels(ctx):
+    """Labels defined but never referenced are clutter."""
+    defined, referenced = collect_labels_and_refs(ctx.text)
+    for label in sorted(defined - referenced):
+        # Find the line where this label is defined for line-number
+        # reporting.
+        m = re.search(r'(?m)^.*\b' + re.escape(label) + r'\s*:', ctx.text)
+        lineno = ctx.text[:m.start()].count('\n') + 1 if m else 1
+        yield (lineno, 'label %r defined but never &-referenced' % label)
+
+
+# --- registry --------------------------------------------------------------
+
+RULES = [
+    # 'relaxed' is the default; rules in this group must produce zero
+    # output on a clean kernel tree (post the small prep-cleanup
+    # commit at the head of this series).
+    Rule('trailing-whitespace', 'relaxed',
+         'no trailing whitespace on any line',
+         check_trailing_whitespace),
+    Rule('tab-in-dts', 'relaxed',
+         'YAML examples may not contain tab characters',
+         check_tab_in_dts, applies_to=('yaml',)),
+    Rule('mixed-indent-chars', 'relaxed',
+         'indent must not mix tabs and spaces',
+         check_mixed_indent_chars),
+
+    # DTS files always use tabs; this is not negotiable per kernel
+    # coding style (.dts files are real source). Relaxed mode.
+    Rule('indent-unit-dts', 'relaxed',
+         'DTS files: 1 tab per nesting level',
+         check_indent_unit_dts,
+         applies_to=('dts', 'dtsi', 'dtso')),
+
+    # 'strict' rules are opt-in (e.g. for new submissions via
+    # checkpatch.pl in a follow-up series). They flag many existing
+    # files and can be promoted to relaxed once those are cleaned up.
+    Rule('indent-unit', 'strict',
+         'YAML: 2 or 4 spaces per level',
+         check_indent_unit_relaxed, applies_to=('yaml',)),
+    Rule('indent-unit-strict', 'strict',
+         'YAML: must be 4 spaces per level',
+         check_indent_unit_strict, applies_to=('yaml',)),
+    Rule('indent-consistent', 'strict',
+         'every line indented at depth * unit',
+         check_indent_consistent),
+    Rule('blank-lines', 'strict',
+         'no consecutive blanks; no blanks at node body edges',
+         check_blank_lines),
+    Rule('child-address-order', 'strict',
+         'addressed siblings must be in ascending address order',
+         check_child_address_order),
+    Rule('child-name-order', 'strict',
+         'unaddressed siblings must be in natural-sort name order',
+         check_child_name_order),
+    Rule('property-order', 'strict',
+         'canonical bucket + pairing + natural-sort order of properties',
+         check_property_order),
+    Rule('required-blank-lines', 'strict',
+         'blank line before child nodes and before "status"',
+         check_required_blank_lines),
+    Rule('hex-case', 'strict',
+         'hex literals must be lowercase',
+         check_hex_case),
+    Rule('unit-address-format', 'strict',
+         'unit addresses must be lowercase hex without leading zeros',
+         check_unit_address_format),
+    Rule('value-whitespace', 'strict',
+         'single-spaced values inside <...>',
+         check_value_whitespace),
+    Rule('node-close-alone', 'strict',
+         'closing brace must be on its own line',
+         check_node_close_alone),
+    Rule('line-length', 'strict',
+         'lines must not exceed 80 columns',
+         check_line_length),
+    Rule('continuation-alignment', 'strict',
+         'multi-line property continuations align under "<" or "\\""',
+         check_continuation_alignment),
+    Rule('unused-labels', 'strict',
+         'every label must be &-referenced in the same example/file '
+         '(skipped for .dtsi/.dtso since labels there are exported)',
+         check_unused_labels, applies_to=('yaml', 'dts')),
+]
+
+
+def select_rules(mode, input_kind):
+    """Return rules that apply to the given mode and input type."""
+    rank = {'relaxed': 0, 'strict': 1}
+    out = []
+    for r in RULES:
+        if rank[r.mode] > rank[mode]:
+            continue
+        if input_kind not in r.applies_to:
+            continue
+        out.append(r)
+    return out
+
+
+# ---------------------------------------------------------------------------
+# Block runner
+# ---------------------------------------------------------------------------
+
+def check_block(text, mode, indent_kind, input_type):
+    """Run all selected rules on a single block of DTS text. Returns a
+    list of (lineno, rule_name, message) tuples."""
+    lines = classify_lines(text)
+    ctx = Ctx(lines, text, mode, indent_kind)
+    rules = select_rules(mode, input_type)
+    findings = []
+    for r in rules:
+        for lineno, msg in r.check(ctx):
+            findings.append((lineno, r.name, msg))
+    findings.sort(key=lambda t: (t[0], t[1]))
+    return findings
+
+
+# ---------------------------------------------------------------------------
+# Input drivers (YAML examples vs raw DTS)
+# ---------------------------------------------------------------------------
+
+def _yaml_loader():
+    return ruamel.yaml.YAML()
+
+
+def iter_yaml_examples(filepath):
+    """Yield (example_text, base_lineno_in_file, example_index) tuples."""
+    yaml = _yaml_loader()
+    try:
+        with open(filepath, encoding='utf-8') as f:
+            data = yaml.load(f)
+    except Exception as e:
+        print('%s: error loading YAML: %s' % (filepath, e),
+              file=sys.stderr)
+        return
+    if not isinstance(data, dict) or 'examples' not in data:
+        return
+    examples = data['examples']
+    if not hasattr(examples, '__iter__'):
+        return
+    for i, ex in enumerate(examples):
+        if not isinstance(ex, str):
+            continue
+        try:
+            base = examples.lc.item(i)[0] + 2
+        except Exception:
+            base = 1
+        yield (str(ex), base, i)
+
+
+def iter_dts_file(filepath):
+    """Treat the whole file as a single block."""
+    try:
+        with open(filepath, encoding='utf-8') as f:
+            text = f.read()
+    except Exception as e:
+        print('%s: error reading: %s' % (filepath, e), file=sys.stderr)
+        return
+    yield (text, 1, None)
+
+
+# ---------------------------------------------------------------------------
+# Top-level processing
+# ---------------------------------------------------------------------------
+
+def input_kind(filepath):
+    p = filepath.lower()
+    if p.endswith('.yaml') or p.endswith('.yml'):
+        return 'yaml'
+    if p.endswith('.dts'):
+        return 'dts'
+    if p.endswith('.dtsi'):
+        return 'dtsi'
+    if p.endswith('.dtso'):
+        return 'dtso'
+    return None
+
+
+# All input types that use tab indentation and follow DTS coding style.
+DTS_FAMILY = ('dts', 'dtsi', 'dtso')
+
+
+def collect_findings(filepath, mode):
+    """Return a (lines, count) pair for filepath. lines is a list of
+    formatted output strings; count is the number of findings."""
+    kind = input_kind(filepath)
+    if kind == 'yaml':
+        indent_kind = 'spaces'
+        iterator = iter_yaml_examples(filepath)
+    elif kind in DTS_FAMILY:
+        indent_kind = 'tab'
+        iterator = iter_dts_file(filepath)
+    else:
+        return (['%s: unknown file type, skipping' % filepath], 0)
+
+    out = []
+    for text, base, idx in iterator:
+        for lineno, rule, msg in check_block(text, mode, indent_kind, kind):
+            abs_line = base + lineno - 1
+            ex_tag = '' if idx is None else ' example %d' % idx
+            out.append('%s:%d:%s [%s] %s' %
+                       (filepath, abs_line, ex_tag, rule, msg))
+    return (out, len(out))
+
+
+# Worker entry point for ProcessPoolExecutor.map(). Top-level so it is
+# picklable on every platform.
+def _worker(args):
+    filepath, mode = args
+    return collect_findings(filepath, mode)
+
+
+def main():
+    import os
+    ap = argparse.ArgumentParser(
+        description='Check DTS coding style on YAML examples and '
+        '.dts/.dtsi/.dtso files.',
+        fromfile_prefix_chars='@')
+    ap.add_argument('--mode', choices=('relaxed', 'strict'),
+                    default='relaxed',
+                    help='which rule set to apply (default: relaxed)')
+    ap.add_argument('-j', '--jobs', type=int, default=0,
+                    metavar='N',
+                    help='run N workers in parallel (default: respect '
+                    'the make jobserver via $PARALLELISM, otherwise '
+                    'os.cpu_count(); use 1 to disable multiprocessing)')
+    ap.add_argument('--list-rules', action='store_true',
+                    help='print all rules with their mode and exit')
+    ap.add_argument('files', nargs='*', metavar='file',
+                    help='YAML binding files or .dts/.dtsi/.dtso files; '
+                    'use @argfile to read paths from a file')
+    args = ap.parse_args()
+
+    if args.list_rules:
+        for r in RULES:
+            applies = ','.join(r.applies_to)
+            print('%-22s %-7s [%s] %s' %
+                  (r.name, r.mode, applies, r.description))
+        return 0
+
+    if not args.files:
+        ap.error('no input files')
+
+    if args.jobs > 0:
+        jobs = args.jobs
+    else:
+        # When invoked under scripts/jobserver-exec, $PARALLELISM
+        # holds the slot count make has reserved for us; this lets
+        # `make -j N dt_binding_check` constrain our worker pool to N.
+        try:
+            jobs = int(os.environ['PARALLELISM'])
+        except (KeyError, ValueError):
+            jobs = os.cpu_count() or 1
+    # Single-process path: keep import surface small for tests and
+    # easy debugging.
+    if jobs == 1 or len(args.files) == 1:
+        total = 0
+        for f in args.files:
+            lines, n = collect_findings(f, args.mode)
+            for line in lines:
+                print(line)
+            total += n
+        return 1 if total else 0
+
+    # Multi-process path. ex.map preserves input order so output is
+    # deterministic across runs.
+    from concurrent.futures import ProcessPoolExecutor
+    total = 0
+    work = [(f, args.mode) for f in args.files]
+    chunk = max(1, len(work) // (jobs * 8)) if work else 1
+    with ProcessPoolExecutor(max_workers=jobs) as ex:
+        for lines, n in ex.map(_worker, work, chunksize=chunk):
+            for line in lines:
+                print(line)
+            total += n
+    return 1 if total else 0
+
+
+if __name__ == '__main__':
+    sys.exit(main())
-- 
2.54.0

