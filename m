Return-Path: <linux-kbuild+bounces-13103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFJENeAbAWpIQwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13103-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 01:59:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D15506DC5
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 01:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DE73301628F
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2026 23:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE94D36C5BF;
	Sun, 10 May 2026 23:58:59 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7936A009;
	Sun, 10 May 2026 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778457539; cv=none; b=MF45Wua1CeGl0ZneUESlJBnheKmvJQu1GApwsUU/uglH0sLjNl7uy1PpBbagYngGKg04KDBKC1OYi0DsPpXi5Hf5Q0+AXOFEbgfKHv4QDBNQSp1KapdaaStCOcKDV54lc8T8hNp9mSsLEA4D1JBHoMU8dSykQF9Orcj+hjuFgn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778457539; c=relaxed/simple;
	bh=eJPtCS9J3HhuHQYsv18hVc5sQbCbBcD5Rcy2wX7nSPE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2zDgiymyIKgJ6jGpMreBMkmE69g9DAhhog7iZFSzPcjqzESSQaz7JwMevwkB9MtnLiUMA7QJCKmPw7sN9LWjT/0XOsGWLyQyT1WiPHW0V4K6u1aa61ok2Jnyb2Vp7tLLUexzpWz663Qxug+TF1c1FKfPqQ9bTPnXPJw5Hwkh+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wME2v-000000000N3-34Gq;
	Sun, 10 May 2026 23:58:53 +0000
Date: Mon, 11 May 2026 00:58:50 +0100
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
Subject: [PATCH v3 2/3] dt-bindings: wire style checker into dt_binding_check
Message-ID: <15c7795ac1c2a6aa71fc6967223869b0b285f4c9.1778454442.git.daniel@makrotopia.org>
References: <cover.1778454442.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778454442.git.daniel@makrotopia.org>
X-Rspamd-Queue-Id: 50D15506DC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13103-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.668];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,makrotopia.org:email,makrotopia.org:mid,checkpatch.pl:url]
X-Rspamd-Action: no action

Run dt-check-style as part of dt_binding_check_one. The recipe wraps
the tool with scripts/jobserver-exec so worker count follows the GNU
make jobserver -- `make -j N dt_binding_check` constrains the checker
to N workers rather than spawning one per CPU.

Default mode (relaxed) is zero-violation on the current tree, so this
does not introduce new warnings into make dt_binding_check. Stricter
rules are available via --mode=strict (eg. for use by checkpatch.pl in
a future series).

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v2:
 - use Kbuild's $(tmp-target) instead of mktemp so build output
   stays inside the build folder (Nathan)
 - collapse the conditional cleanup tail into the familiar
   "&& touch $@ || true" pattern, matching cmd_chk_bindings;
   keeps future warnings non-fatal (Rob, Nathan)
 - retained the explicit $(PYTHON3) prefix (Rob asked why it
   differs from the rest of this Makefile): per
   Documentation/kbuild/makefiles.rst "Script invocation",
   in-tree scripts should be called through their interpreter so
   the executable bit and shebang are not relied on and the
   user's $(PYTHON3) override is respected. The neighbouring
   recipes invoke their Python helpers directly because those
   come from external packages (dtschema's dt-extract-*,
   dt-check-compatible, dt-doc-validate), which is the case Rob
   asked about and which sits outside that rule.

Changes since v1:
 - dropped xargs -n200 -P$(nproc) sharding; single Python invocation
   with file list via @argfile
 - dropped `|| true`: relaxed mode is zero-output today
 - wrapped under scripts/jobserver-exec so worker count follows the
   make jobserver

 Documentation/devicetree/bindings/Makefile | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 7b668f7fd400..df4c4e0da1dc 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -46,6 +46,18 @@ quiet_cmd_chk_bindings = CHKDT   $(src)
 			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
 			  && touch $@ || true
 
+DT_CHK_STYLE = $(srctree)/scripts/dtc/dt-check-style
+
+# Feed the file list to the checker via @argfile in a single Python
+# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
+# claims slots from the GNU make jobserver and exposes the count via
+# $PARALLELISM, which dt-check-style picks up to size its worker pool.
+quiet_cmd_chk_style = STYLE   $(src)
+      cmd_chk_style = $(find_cmd) > $(tmp-target) && \
+		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
+		      $(PYTHON3) $(DT_CHK_STYLE) @$(tmp-target) \
+		      && touch $@ || true
+
 quiet_cmd_mk_schema = SCHEMA  $@
       cmd_mk_schema = f=$$(mktemp) ; \
                       $(find_all_cmd) > $$f ; \
@@ -62,13 +74,16 @@ override DTC_FLAGS := \
 $(obj)/processed-schema.json: $(DT_DOCS) check_dtschema_version FORCE
 	$(call if_changed,mk_schema)
 
-targets += .dt-binding.checked .yamllint.checked
+targets += .dt-binding.checked .yamllint.checked .dt-style.checked
 $(obj)/.yamllint.checked: $(DT_DOCS) $(src)/.yamllint FORCE
 	$(if $(DT_SCHEMA_LINT),$(call if_changed,yamllint),)
 
 $(obj)/.dt-binding.checked: $(DT_DOCS) FORCE
 	$(call if_changed,chk_bindings)
 
+$(obj)/.dt-style.checked: $(DT_DOCS) FORCE
+	$(call if_changed,chk_style)
+
 always-y += processed-schema.json
 targets += $(patsubst $(obj)/%,%, $(CHK_DT_EXAMPLES))
 targets += $(patsubst $(obj)/%.dtb,%.dts, $(CHK_DT_EXAMPLES))
@@ -82,7 +97,7 @@ dt_compatible_check: $(obj)/processed-schema.json
 	$(Q)$(srctree)/scripts/dtc/dt-extract-compatibles $(srctree) | xargs dt-check-compatible -v -s $<
 
 PHONY += dt_binding_check_one
-dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked
+dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked $(obj)/.dt-style.checked
 
 PHONY += dt_binding_check
 dt_binding_check: dt_binding_check_one $(CHK_DT_EXAMPLES)
-- 
2.54.0

