Return-Path: <linux-kbuild+bounces-12256-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGLqOTbyw2lZvAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12256-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 15:33:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CCC326D0B
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 15:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B49B4307D4C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A413257844;
	Wed, 25 Mar 2026 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="Fcyma1Cr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1C43E0C77
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448714; cv=none; b=e44mlPyM1NtVG1zlWbRDdli/j/B4Cb4/VrF+EARxdZ+sZerjgmcr+FVac5eID77Fnvuul4pTBcACFe46L1BTBuacjkwyHm6pgI6K2zr6XkeclE2XKvWvSSnSR0kpVVcoK8xv3cGLb3Yf1maZKQStAagjaA8RSmVzRbGXt4u9GvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448714; c=relaxed/simple;
	bh=KeIOzKBhU62G/u5cZ3gJ8+XPcO7J7CGnTPeue6bXdMQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:Cc:
	 References:In-Reply-To; b=UgrXiS/XZSSd3Rzu8FAzqQOeDhv4NRodckHozMORX2KH73vk6lSmLDBwW8tgF6hFvixOWPtGdQiSLw32rE8Ta81tmlseI0gJ//B+Kpx6i6KnblDB8134ROuHXLlfRXDAdd7729ZTJMnjWnP8KZtcOCKqzTEHd2yfPhxdhFOE/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=Fcyma1Cr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so44944305e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774448705; x=1775053505; darn=vger.kernel.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsxBp0FI4f/EC09mqgJEiJLgATjdt2ORoT6797B+Cpc=;
        b=Fcyma1CrkkUgSJh+Rt7Y/Y9GRRYq3jThgvTK/uyQOF9UAiqVknxKbd697JvKrOGWNi
         mbo/CA9ebzBoqkY3LWh1tgngvFOt98IeZQTImROP+9XRRyaUGjZ/Eli1E7MSNXXWJ2iv
         XUCkgNk3aKM4im1i2V/z0LOfkhcshP74YLvbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448705; x=1775053505;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xsxBp0FI4f/EC09mqgJEiJLgATjdt2ORoT6797B+Cpc=;
        b=plP8H8Ve3BfFjHYRD7kDuvjXiZ5V2H3k3513Yw2xiuXhI9XHFLtEnE18G+NmL6DNdc
         8RUJiZtZ7wH4bctDf8wzkmpS6kl87ohI6drfW81SVrjTh4D3XKR0O3YFzTP1ctn1s5HN
         t+jYDGYimnqkAEORwAKkmnc+qq13dmutRlquVRcdnHfhNegi1+lTSO8CMs1NnjCwZIYT
         AIZMu4JbUIghpMbIoahXiXO3HfSwB6fDAtyoBuzKe0JEY5mlumrahJ0LSQTMiLu4oFOH
         IxNmJq1HDrZemXqirVXi64GR2bwrBPABfrRkCqGWqNiQFoUoTMREmKdz/FavG+RF1XTm
         eOsg==
X-Forwarded-Encrypted: i=1; AJvYcCVYoMkQMfB6zC5Qpa+/5QMpc9IWq6cZEKNzgofAs4VKhHYxY+OZfqnkYHOzYcboQTSgwPBJEYmF5ivImKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YySLH8qnb7jjrsKzXozHBKW6aPjQM2fblufhoeEXZrxRkQ+eGaq
	CDRF9TzRQhbM8bUucgKLNXHBdzWq/rqPCoZJrk4BEPmvv8GgnDVCAwJcQp5elmUps9w=
X-Gm-Gg: ATEYQzx/lPBft0WPUeWs7ldLeJxzmZhKUgF3x2HW0uo1DNvInGGGAE7t+mVCwSt8zDf
	KkEvsR4OzUv3NaLAVbMrmlGM6RI2YuM6rOHhSV6MJmpakc/619Kbs2ouLUfFj3mgAm8otpotib4
	rYhJxPscNlCbqk2GGFjRRksn29C3lvjzXmRROQPbaeyLgkE2YRpgwxe7fzPndcoqalbf9fRCmpA
	717eIlw0OC43Jh21qxiZApMvp9HI5/pcc3KqV4iXqbQE0s6jakX3QktINRejNN5vyULmMCReZ8l
	Q/q/TgbjUngWVNXIFFIDhASRNtH1INs0Fx1Xsx42FdFzqfAz4Z8sfX5XVVtlpKPrVOEbVHnjBq1
	HSXiW79PwzOM80abWDFPNrP8MMxDhpon6os4TT0HL3Bna2jlNFXtoXMbRgWsZOvon8u6xlYPOC+
	U4ouCTk113pIAC9aDgOUiAdzc4OV9G+DmofWF5Q+kXkq4eloEKkGxSoEKS2w9XhgXiCCtcj9Ain
	SqrSBO2sSxAnSs=
X-Received: by 2002:a05:600c:8b0a:b0:487:1114:d431 with SMTP id 5b1f17b1804b1-48716039d36mr58720685e9.18.1774448705431;
        Wed, 25 Mar 2026 07:25:05 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48717337fa3sm33382655e9.9.2026.03.25.07.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 15:25:04 +0100
Message-Id: <DHBXKH7PG0NH.1KU2M9L2IMLJ5@smile.fr>
To: "Mohamad Alsadhan" <mo@sdhn.cc>, <nathan@kernel.org>, <nsc@kernel.org>,
 <ojeda@kernel.org>
Subject: Re: [PATCH v5] kbuild: host: use single executable for rustc -C
 linker
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <gary@garyguo.net>, <linux-kbuild@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260317112021.14353-1-mo@sdhn.cc>
 <20260321150034.9915-1-mo@sdhn.cc>
In-Reply-To: <20260321150034.9915-1-mo@sdhn.cc>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smile.fr,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[smile.fr:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[smile.fr:+];
	TAGGED_FROM(0.00)[bounces-12256-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yoann.congal@smile.fr,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sdhn.cc:email,smile.fr:dkim,smile.fr:email,smile.fr:mid]
X-Rspamd-Queue-Id: 47CCC326D0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat Mar 21, 2026 at 4:00 PM CET, Mohamad Alsadhan wrote:
> rustc's -C linker=3D option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=3D$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
>
>   error: multiple input filenames provided ...
>
> Generate a small wrapper script and pass it to -Clinker e.g.
>
>   ```
>   #!/bin/sh
>   ccache gcc "$@"
>   ```
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

Hello,

First, thank you for working on this. This is appreciated :-)

> ---
> v4 -> v5:
>   - Fix word splitting issues
>   - Remove unnecessary `exec sh -c` and simplify generated script
>
> v3 -> v4:
>   - Use filechk instead of if_changed macro to regenerate script
>   - Remove trailing space at EOL
>
> v2 -> v3:
>   - Scrap previous hacky approaches (e.g. using lastword) and go with
>     a proper fix which turned out not that complex to implement.
>     Apologies Gary, I should have listened to you earlier :/
>
> v1 -> v2:
>   - Rename HOSTRUSTC_LINKER to HOSTRUSTC_LD for consistency
>   - Introduce explicit HOSTRUSTC_LD override
>   - Warn when falling back due to multi-argument HOSTCC
>   - Error out if a user-specified HOSTRUSTC_LD is not an executable
>
> v1: https://lore.kernel.org/all/20260225102819.16553-1-mo@sdhn.cc/
> v2: https://lore.kernel.org/all/20260227132713.23106-1-mo@sdhn.cc/
> v3: https://lore.kernel.org/all/20260312002852.11292-1-mo@sdhn.cc/
> v4: https://lore.kernel.org/all/20260317112021.14353-1-mo@sdhn.cc/
> ---
>  scripts/Makefile.host | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646..2d2429ca0 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,11 +87,29 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
>                   $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
> =20
> +# rustc's `-Clinker=3D` expects a single executable path, not a command =
line.
> +# `HOSTCC` may be a multi-word command when wrapped (e.g. "ccache gcc"),=
 which
> +# would otherwise be split by the shell and mis-parsed by rustc.
> +# To work around this, we generate a wrapper script that forwards argume=
nts to
> +# `HOSTRUSTC_LD` so that such commands can be used safely.
> +#
> +# Set `HOSTRUSTC_LD` for a different rustc linker command than `HOSTCC`
> +HOSTRUSTC_LD ?=3D $(HOSTCC)
> +define filechk_rustc-wrapper
> +	printf "%s\n" \
> +		'#!/bin/sh' \
> +		'$(call escsq,$(HOSTRUSTC_LD)) "$$@"'
> +endef
> +
> +$(obj)/rustc-wrapper: FORCE
> +	$(call filechk,rustc-wrapper)
> +	$(Q)chmod +x $@
> +
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree
>  # modules case.
>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) \
> -		 -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +		 -Clinker-flavor=3Dgcc -Clinker=3D$(obj)/rustc-wrapper \

Shouldn't this fix be also applied to rust/Makefile?
It also contains a "-Clinker=3D$(HOSTCC)" argument for rustc[0].

With something like the following (On a 6.18.19), it does compile:
diff --git a/rust/Makefile b/rust/Makefile
index d4618f646b05..516fc1ea872d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -422,7 +422,7 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORC=
E
 quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro =3D \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
-		-Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
+		-Clinker-flavor=3Dgcc -Clinker=3Dscripts/rustc-wrapper \
 		-Clink-args=3D'$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --extern proc_macro \
 		--crate-type proc-macro \

Note that I did not use the same patch: scripts/rustc-wrapper instead of
$(obj)/rustc-wrapper.
$(obj)/rustc-wrapper did not work (the wrapper was searched in rust/ and
not found) when I tried it.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/rust/Makefile#n553

Regards,

>  		 -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
> @@ -153,7 +171,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
>  quiet_cmd_host-rust	=3D HOSTRUSTC $@
>        cmd_host-rust	=3D \
>  	$(HOSTRUSTC) $(hostrust_flags) --emit=3Dlink=3D$@ $<
> -$(host-rust): $(obj)/%: $(src)/%.rs FORCE
> +$(host-rust): $(obj)/%: $(src)/%.rs $(obj)/rustc-wrapper FORCE
>  	+$(call if_changed_dep,host-rust)
> =20
>  targets +=3D $(host-csingle) $(host-cmulti) $(host-cobjs) \


--=20
Yoann Congal
Smile ECS


