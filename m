Return-Path: <linux-kbuild+bounces-11888-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI3EEcXEsmmvPAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11888-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 14:51:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C65C3272E9C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 14:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18F4930058C9
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 13:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECE131E844;
	Thu, 12 Mar 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTAQtzaD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB3B2D97B7;
	Thu, 12 Mar 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323457; cv=none; b=p7UTmaIIQGpA1t7xKWl60TlURTYpOn+smRpVTX/IUGrthJqVP996WhsxO+kzxvIEV2xjO3sMv5YaQSZ0LzkkaLqWNBjpSpiGjkWWqdJ99iYaRV7fqOBCeWwteHvLIpgfsgDHYbBZXs3Nf0hGHoYxStkmxU0x9F8m6CEY+J3O/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323457; c=relaxed/simple;
	bh=MPIeNNTlVH9Z2p3UIhJcX0ghC8IxgIbo7gwLM9YM1NI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hJUmdOK4ZIpNLhs6IzicYddVnwi/YTB66wq5CRfj+y3Zpj+5atOLB9Vx6aSINN6HmVPoz92edCuTOhA81tF2oqEVd97LpDv9rfCBn0+YXw3408pFBTrV+fvT8U+D+oFCan2sB/VyNyNXM9vzh9NFxnv4nrLRqNfRRJ+KjAjDkww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTAQtzaD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802D8C19424;
	Thu, 12 Mar 2026 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773323457;
	bh=MPIeNNTlVH9Z2p3UIhJcX0ghC8IxgIbo7gwLM9YM1NI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=uTAQtzaDEMkkjVPvhpMws0MIVbUq3WN7YF1ckCqfW6Lvkj8b28i1M1o5eVUVfJWBC
	 M367e7GCUyE4ui9BT2X2SGmGk7vnKKhT+zs6xW8s89wkJpehPb4WB0oY3CuOhm2QrI
	 BC/L3yJy7anCFXA4+7geB+fepu8ygRL6Tjxg8VvdBwk/WsqdW1yR28nXwA0KIr4Ogj
	 XcBQ4he1XW2sx4OqKq2w6sRkET2v3TpEUfdA98AZkJpZYaYMznzlt//XwJl8ieEHyP
	 fWvuSuGcLIWs12E/yXnTu9yqZk3oQ3vKCNmk+DqF/0eODFojDgcdn2yiP0BlZGnb03
	 DYsPqGXPxzIQw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] kbuild: host: use single executable for rustc -C
 linker
From: Nicolas Schier <nsc@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
 miguel.ojeda.sandonis@gmail.com, linux-kbuild@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Yoann Congal <yoann.congal@smile.fr>
In-Reply-To: <20260312002852.11292-1-mo@sdhn.cc>
References: <20260227132713.23106-1-mo@sdhn.cc/>
 <20260312002852.11292-1-mo@sdhn.cc>
Date: Thu, 12 Mar 2026 14:50:39 +0100
Message-Id: <177332343971.79321.12799380648348230294.b4-review@kernel.org>
X-Mailer: b4 0.15-dev-24587
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=MPIeNNTlVH9Z2p3UIhJcX0ghC8IxgIbo7gwLM9YM1NI=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpssS06/wMwVg26i+gKyq1DXILYOnxr4HmmKiDU
 NRo2hvQi0GJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCabLEtAAKCRAHUgpwFiYS
 aQRLEACQ0u0ggE4vQllnxrxQqCB6ke2lHWK6UgtRzbKknMgFF+cJ2Go9X9S4nuHHk/PIpDIdxNR
 C1vCIGvBXVvSu6IaAxUfksGFtTQqZNmDkPy0q7J9at+fcXZ8SIxMBWu9MbznobGkDg8cOVMHDYZ
 5QVEsJ58Tuq4CgUSmCZglaxTTMxYzp4IcPzgb8hgKc/35S5k8gUGIBSxpTxKQIM5N6UTYQdecF0
 hlrZvGd2Mm5a0B+Tye5U0Dou0AUrevDv8o74fl+w8tXZpGAOxz71by9R9gysgDcbpOjkp8Sej+U
 M3BsVaEZz3u7j3mKGOJ9zEc073l2UL4eT2i/uRf6XU+HGayZdrB4GWBcgO8F9/jueJLsh9YEAgb
 AQOqNGSqTIHZSk9DUD49znFSaB8h/UA+weao+o80gRpvceqB8L3m4BMGXfQCNpz/pThkXLUAkQT
 Yg2heQhZF/c+m2lmToS9CVsv+OGIqnz3w1uRyeDIb1GAk+z99b8DN7kdk765hkyMACl8BlZl3U2
 55/z7TFfFIaHUxq5QYPAc2vsNF06i7wMZ03qrtBx8boB2aSV9i9Dypcewdl83SR96D/6o8DDAW+
 aZzmLCU4zk48kh6keBJRwmid4w4v9qr1UnalvCtf23l1sgxcNh/CnYvvASdQwH7fMxLJM6CxSSg
 xD/9aUoVmTYoC6Q==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,gmail.com,vger.kernel.org,smile.fr];
	TAGGED_FROM(0.00)[bounces-11888-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smile.fr:email]
X-Rspamd-Queue-Id: C65C3272E9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 03:28:52 +0300, Mohamad Alsadhan <mo@sdhn.cc> wrote:
> rustc's -C linker= option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
> 
>   error: multiple input filenames provided ...
> 
> Generate a small wrapper script and pass it to -Clinker e.g.
> ```
> \#!/bin/sh

('\' is just a copy-and-paste left-over)

> exec sh -c 'exec "$0" "$@"' ccache gcc "$@"
> ```
> 
> This fix should be general enough to address most if not all cases
> (incl. wrappers or subcommands) and avoids surprises of simpler fixes
> like just defaulting to gcc.
> 
> This avoids passing the user command as an environment variable as
> that would be more challenging to trace and debug shell expansions.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1224
> Suggested-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
> 
> ---

thanks for v3 with the wrapper script; it looks cleaner to me.  Some
comments below.

>  scripts/Makefile.host | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646a39..f976a07b7b09 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,11 +87,28 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
>                   $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
>  
> +# rustc's `-Clinker=` expects a single executable path, not a command line.
> +# `HOSTCC` may be a multi-word command when wrapped (e.g. "ccache gcc"), which
> +# would otherwise be split by the shell and mis-parsed by rustc.
> +# To work around this, we generate a wrapper script that forwards arguments to
> +# `HOSTRUSTC_LD` so that such commands can be used safely.
> +#
> +# Set `HOSTRUSTC_LD` for a different rustc linker command than `HOSTCC` 

(trailing space at EOL)

> +HOSTRUSTC_LD ?= $(HOSTCC)
> +quiet_cmd_rustc-wrapper = HOSTGEN $@
> +      cmd_rustc-wrapper = \
> +	echo '\#!/bin/sh' > $@; \
> +	echo 'exec sh -c '\''exec "$$0" "$$@"'\'' $(HOSTRUSTC_LD) "$$@"' >> $@; \

Why can't we just use this?

    echo 'exec $(HOSTRUSTC_LD) "$$@"' >> $@; \


> +	chmod +x $@
> +
> +$(obj)/rustc-wrapper: FORCE
> +	$(call if_changed,rustc-wrapper)

The if_changed macro is not optimal here, as there are no real prerequisites
for the $(obj)/rustc-wrapper rule but only FORCE, cp.
Documentation/kbuild/makefiles.rst ("Command change detection").  Thus, the
rustc-wrapper will always be rebuilt and so always show the 'HOSTGEN' line.

But you could use filechk instead, e.g.:

define filechk_rustc-wrapper
	printf "%s\n" \
		'#!/bin/sh' \
		'exec sh -c '\''exec "$$0" "$$@"'\'' $(HOSTRUSTC_LD) "$$@"'
endef

$(obj)/rustc-wrapper: FORCE
	$(call filechk,rustc-wrapper)
	$(Q)chmod +x $@


Kind regards

-- 
Nicolas


