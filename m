Return-Path: <linux-kbuild+bounces-12966-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGatKhji82mG8QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12966-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 01:13:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA364A8B70
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 01:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC8FA3006234
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 23:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9B33A3E68;
	Thu, 30 Apr 2026 23:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0Vp4vz2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0283A2572;
	Thu, 30 Apr 2026 23:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590803; cv=none; b=dEitxVJXLCcPkn1bBsPbWSUyxvEQ5+WttPCFPHXahAj9fcT6VJWgi60jiwGgWsBZ0Zl7oJAZCv5l82ciSqkif1rCu0KhCjPXRrU1bsUMgC42Pd+eg0JhFAfejbXi97k08z3DDKHxMZwjk1AKON1PAZk/GQqA+s0Sprvd9aI+tNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590803; c=relaxed/simple;
	bh=7xRirdrcdNDJxBT3KqPmWP/KblOa1u6IjU3g1eGOTAY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GgCIjG45V+WTTgxUSRLkNnlgIFzNo7TqhyYLLhfDOQ9EPcv64XjLfJ5y0A1/cVQGJzBB79dQsVYEHHgdDsCQkQYA5NclPhhM5Cv5zadLcT6ZaXumA5WuaERk5mKLLfpMUtuQMWsnUtwmnqk9QrRD4TK5GmISZK9AkigfvJMxLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0Vp4vz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54CEC2BCB4;
	Thu, 30 Apr 2026 23:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777590803;
	bh=7xRirdrcdNDJxBT3KqPmWP/KblOa1u6IjU3g1eGOTAY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=A0Vp4vz26gaM8UyTLq8CWy33QKFEWsclMRGvqpdNTSsbAgFkf7TOtlEuSuW0shbJW
	 UZxIU5Fdz8haBPyweDgKs2dTb2GTQwffOn8fZeWCQLIb/xcPTm/1iuvpTWCA736GI4
	 i12Up1Gdy3hWc2e5+pZPygqe3TERO2Ee4sl/9XGK1jzLTL1eJdDyzZkEx49GKRo1wf
	 8BpyJNGNVpMs4EAlslQHab/0EnsMLsuHqyHyVusAG8/itNJlWZxdcDEWN13cb2HvBK
	 1xyQv62xpdm/lEaVdHDBPq7bXNp93kXrH02tgM6E0Pfo79nVHjwTeTkmvLEsrshGek
	 CqkK/aWQ2B//A==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/3] dt-bindings: wire style checker into
 dt_binding_check
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Tamir Duberstein <tamird@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Guenter Roeck <linux@roeck-us.net>, Aleksander Jan Bajkowski <olek2@wp.pl>, 
 Test User <test@example.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <ed254ed45f19f37a7e7933a33f2f00195d8e5f20.1777471439.git.daniel@makrotopia.org>
References: <cover.1777471439.git.daniel@makrotopia.org>
 <ed254ed45f19f37a7e7933a33f2f00195d8e5f20.1777471439.git.daniel@makrotopia.org>
Date: Thu, 30 Apr 2026 16:13:14 -0700
Message-Id: <177759079451.708.5456611555998959857.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2021; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7xRirdrcdNDJxBT3KqPmWP/KblOa1u6IjU3g1eGOTAY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmfH/FHhYTsv2h8NFZN/nyQaG7KOxUJz8tBT8wPNO0su
 NydPbmzo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExEnYuR4VarC6vqstvTGuPW
 Cb1zOfvonmy5xpapVUXcRXlzvmxpdmJk2PWJ/eutFb/n1XopTgl8X/5NV2uV964Xu/Trioy2usu
 lMwIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: ADA364A8B70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12966-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,goodmis.org,roeck-us.net,wp.pl,example.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url]

On Wed, 29 Apr 2026 15:21:33 +0100, Daniel Golle <daniel@makrotopia.org> wrote:

Hi Daniel,

Some comments from the Kbuild side.

>
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> index 7b668f7fd400..35ddd0b7a349 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -46,6 +46,19 @@ quiet_cmd_chk_bindings = CHKDT   $(src)
>  			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
>  			  && touch $@ || true
>  
> +DT_CHK_STYLE = $(srctree)/scripts/dtc/dt-check-style
> +
> +# Feed the file list to the checker via @argfile in a single Python
> +# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
> +# claims slots from the GNU make jobserver and exposes the count via
> +# $PARALLELISM, which dt-check-style picks up to size its worker pool.
> +quiet_cmd_chk_style = STYLE   $(src)
> +      cmd_chk_style = f=$$(mktemp) && $(find_cmd) > $$f && \

Please use Kbuild's $(tmp-target) for temporary files:

  cmd_chk_style = $(find_cmd) >$(tmp-target) && \

I see that mk_scheme uses mktemp but all output from the build should
stay within the build folder. It would make the clean up below
unnecessary, which would simplify things future with a suggestion I have
below.

> +		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +		      $(PYTHON3) $(DT_CHK_STYLE) @$$f; \

@$(tmp-target)

based on the above suggestion.

> +		      r=$$?; rm -f $$f; \
> +		      if [ $$r -eq 0 ]; then touch $@; else exit $$r; fi

Does this work with Kbuild's use of 'set -e' for cmd? I think this could
just be simplified to just

  touch $@

since the 'r=$$?' won't be reached if dt-check-style exists with a
non-zero exit code? Sashiko has some comments around this if you have
not already seen it:

  https://sashiko.dev/#/patchset/ed254ed45f19f37a7e7933a33f2f00195d8e5f20.1777471439.git.daniel@makrotopia.org

-- 
Cheers,
Nathan


