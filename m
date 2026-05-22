Return-Path: <linux-kbuild+bounces-13311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PisBRmdEGpuawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13311-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 20:14:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EC45B8E59
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 20:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 999A630210EA
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 18:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4377B363C7C;
	Fri, 22 May 2026 18:05:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D355367F26;
	Fri, 22 May 2026 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473102; cv=none; b=M0xjsCVUybjEO/x+CqFOfdg0pOrEsgZ+Anii7B2HXQ8NgrAUJzK4NtzoJ4eU43/0cf5OXHfBLzGviMN9oIjf4L1GEhIAVQaYwQvQ8LGXgwo8aXFzyU7u2ExlyFYY940vzPmzO28rSgX7xC+ajaTMHN8BR6YoahmogBGrb8h/bE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473102; c=relaxed/simple;
	bh=VdzibMjS69RcKL42m6TG47UmRNAwDIGZjTq8j4b6w38=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9FZwBJW3ZpvJSzI+Njmwuc2WwjmOCAg431lY6eCJY5PejrPnvNT5qD/iPKptjWHoTAvIozVIUz6V3PIoiwnaoD4qKgh+0Ejwkx6/guFPUYfMhGEHVvBbbn/021IrdzhQvyTHvMnq80J59xNsFKDO8MirLTN++nVku+BUTXNECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wQUEu-000000006y0-1kS3;
	Fri, 22 May 2026 18:04:52 +0000
Date: Fri, 22 May 2026 19:04:49 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Guenter Roeck <linux@roeck-us.net>, Test User <test@example.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: wire style checker into dt_binding_check
Message-ID: <93923232b32423d33dc3b6632165ccc9571dea8f.1779472837.git.daniel@makrotopia.org>
References: <cover.1779472837.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779472837.git.daniel@makrotopia.org>
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13311-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[makrotopia.org];
	FREEMAIL_TO(0.00)[kernel.org,makrotopia.org,garyguo.net,weissschuh.net,goodmis.org,wp.pl,roeck-us.net,example.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.772];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@makrotopia.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url,makrotopia.org:mid,makrotopia.org:email]
X-Rspamd-Queue-Id: 69EC45B8E59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes since v3:
 - build the @argfile with f=$(mktemp) and remove it with rm -f
   (matching cmd_mk_schema), instead of Kbuild's $(tmp-target)
   which leaves a stale .tmp_.dt-style.checked in the build tree

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
---
 Documentation/devicetree/bindings/Makefile | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 7b668f7fd400..00149e824261 100644
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
+      cmd_chk_style = f=$$(mktemp) && $(find_cmd) > $$f && \
+		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
+		      $(PYTHON3) $(DT_CHK_STYLE) @$$f \
+		      && touch $@ || true; rm -f $$f
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

