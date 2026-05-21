Return-Path: <linux-kbuild+bounces-13299-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MEeKxhUD2raJAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13299-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 20:51:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A36605AB42A
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 20:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E9823042970
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 18:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA893390614;
	Thu, 21 May 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DkGEKU02"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94B36DA03
	for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388317; cv=pass; b=SUZyhiyhcDN4af2daVbccc9vne7nOlQbbnDzC+AtmHQX3UDX2/WRtToXZoU2Rwu4AR5lfTB8oJyHOHMPeAM+YS0+IsXZXmjOdBtLtxNGviUuDuNIkcc9jfbD3OUSXm97JWxmTDtUAYHzOQXBM1KrfnpQVb2iptvkcI4rHoDnCEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388317; c=relaxed/simple;
	bh=JCUL6BVAaRV0BJqq4ez4qxChXAzJLI8JUaO8Tc9BWzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFA00JtFyQnieLlejdGWIN+h6fn15G3Jv0PgU/HoUEMlLSjbF5/EgMVJSphBSmKLZXUpDn12vwwvdIj40nVbJCvc5OzSbKy+aMSks+Gy+XtgaM9OF5/wz40lW9HYs/WnVjdUFdmXN6ht3802ihGcXe7n+UxGxKTCqGsrC01I3IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DkGEKU02; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-515548f390fso1221cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 11:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779388315; cv=none;
        d=google.com; s=arc-20240605;
        b=JigdcGqu+rqS0MrJZwpwfagvu9w2n+6xDD0zXznOKT3+6ndorhOtN4YGeeFDS/lVjL
         bfSbs+H53vjbhdjXYSZP5g/u+KdkxksZe69tgLLk+8ZGtk1dqrcNnQAEnou9AFxvnl3Z
         KkuMxQ/HY2i8Br+lMCdsTkzvkfg1Jm4GHDIj4HHXdn/bPa8e3zH0CNOvvh4rQWBkV7S7
         QIN0J9/TpuZ1D5higlbmaD1dE4njTS1ydDhWeLW2kKuYhGJYq2vAm1qd+qhY2gyM9M+E
         cP+EAcezqiw3AifH2Rr9utEYgHhWDgYiBDouVNVY1z6PYM8u3/YAdToGgYhiK/7sptfJ
         1xtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4HPdoCW0jGYUIMarCqD5b6sgxXyrUSlqYmstTvtcfA=;
        fh=vS66dfGRF6+pIVuTkj0KwUw6MqBpn2B8CEdgB8wvV1o=;
        b=KSghMz5AcwBmCTh14ACz27E1yDAJsI65TeyD97IaI7PJFVAPM39G5kbTiY8Uf2afg+
         kEdT4/YBp16rtKvFNo5xj5SeEaf9IVGJ3iTFjpNoW7KnmA5d6a/epwKd4La3c8IXZXfH
         2gO2GsFGZdLq9p7ICyf3b1W8+f4AT7dN5fTvaQ+Nv+4H5UPRdwT/LW1/+lx6Ui8M1R5Q
         Z3m5U9We87EZrBmPT2LjgDDnz/DD6YVpf4DkAqls99wBaVVbx06lSETEQOntR9c78SV4
         EiZd1q+ahnnoBTvM8pdEj2Zbj+tVKKxxg55I9ya5OvGMtklZ0TzOuhK6m8t6ZPGvysMR
         LOWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779388315; x=1779993115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4HPdoCW0jGYUIMarCqD5b6sgxXyrUSlqYmstTvtcfA=;
        b=DkGEKU02yYtQR5UJwc8dScWi2wRbiJiaQn14zhFiDEB9FtCUoYQagnxZU9lvlGApeS
         md7TDPnNbeA7A4cavuxO4HQQECrNHi448ayU4tJlN9af/gaQYl9zvgbfh8VSbqKiYimY
         2m+XUY/Hb775ByaaA1n/VGree2ErkeCATws96VrjuHvSjixzH8/2o0ZOqGUiF1Skm+iV
         cwVAh/gn4+V6eBLM/WllmeBZ8/+Y4zsdiYIuNH0N5f14rks2OAITojxSG2QDN4NsXsrP
         EK/dfLDn2qyofxpRcJ4W6A6e9NRtjSZe9oB9bS+HsM82a2rjYTvgmj5W2YMANfwdP7vs
         614g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779388315; x=1779993115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4HPdoCW0jGYUIMarCqD5b6sgxXyrUSlqYmstTvtcfA=;
        b=QGr7HoyeysEqsxII2YpJFxktGoi1M7r/2vpVwZ2N4tpZWtYWY/ATtGGFzmxuI0aV1e
         CAF4QwaZaq5WwmID/Bmj/QZDrCK6qY9Vl/V/BlGr7gM9yv8lD1s48YDQTXJoEd+bDJwE
         wggzSJi015mK5Aa3uVYfnNt9Nnc/NwmBATxkPV9ZhidZ647V1n/CnlmhetS/eSo05xqr
         qJ8Rhc/5KjXfae+GvVbKA4EXD4lCmrlPyRcgG/ZAbxfaXPVvzTXda+vn1afAiFc2rw3v
         t3UAInE9fADlyf0l8YzZGlE1kFyu4ttZfDO2Q7R+7VEAQJXx8F22Xwc3BAyWGwVNYuIY
         N7Sg==
X-Forwarded-Encrypted: i=1; AFNElJ/CSkR+kD4b/N9taFspkeVzkF2yexWOgr7YJtqPdaxjb3HgYaC0jrXoQc2BSn6dChO3ucAytBf+o/juovo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOwdEGVhyjJ04qvJz04PCHyf/f3Wb5Usfyc6Hpbk515FDCUwQJ
	wyHvEE9UvCv1RaER6BdlhzhJlfatUB5qzsXz2cyByO4NlrspplOmSCt5WfSSD/pU201HkEf5rtx
	kdWi31NAmHsYyr6t3zYaRZeVZkNzj1C1YrM0+g7z7
X-Gm-Gg: Acq92OG6NmCKu0woZO68FHhyRMWs6wGt8LGpBsW2YyyM4kgeDpg5SANQWmz/2p4MTlk
	guUnaUIcWg1rkDfPWM3Xh1MywffdZmmXBG4oWJokKr8Pv84ZcAgmO4M9plCL3ITrmokO+ddb4fZ
	qTbwCYiO88w/8O4e/4cZZAnnVwbTZaW/OiKNizt/NSbxOeIwlHioj02+05TNJPRdBrTQlPgIxsY
	s5CSvF9wSz+3xjxA05eQqWwdg8Ud26VZqIQUyDMFFcfXuE1RFg8wqOC4a56VmY+c5hWkxgaKeXx
	m37B4lkEt7rE6D59Cf4XQdE0hL5wIM5TMrUmx+S/OXyOqQcKbQ==
X-Received: by 2002:a05:622a:8409:10b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-516ccc0f77fmr3401731cf.9.1779388314629; Thu, 21 May 2026
 11:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com> <20260331154827.2793269-4-xur@google.com>
 <20260331162729.GA2006419@ax162> <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
In-Reply-To: <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
From: Rong Xu <xur@google.com>
Date: Thu, 21 May 2026 14:31:42 -0400
X-Gm-Features: AVHnY4L-IBnKhTC4Sxx4uCsrsxDz7e6XOGHFPkp2IX4Teayfu17l3WAhSBz_Wsg
Message-ID: <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang ThinLTO
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13299-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,o.map:url]
X-Rspamd-Queue-Id: A36605AB42A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Yonghong, thanks for the update.

Regarding this guard: ther is a period of Clang (before this patch and
after your first patch), even though ld.lld having these options
(specifically --lto-whole-program-visibility -mllvm
-always-rename-promoted-locals=3Dfalse), distributed ThinLTO mode
remains unsupported, correct? What the behvior of using this options
in distributed mode with these compilers? nop or it will lead to
error?

I would assume there will be errors; otherwise, you would not ask me
to change my patch last time. In this case, I would keep this guard
and remove it when the minimum llvm version passes llvm23. What do you
think?

Best,

-Rong


On Thu, May 21, 2026 at 1:57=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> > Hi Rong,
> >
> > On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> >> diff --git a/Makefile b/Makefile
> >> index 69ccf9b8507d..26005c64016d 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
> >>   endif
> >>
> >>   ifdef CONFIG_LTO_CLANG
> >> -ifdef CONFIG_LTO_CLANG_THIN
> >> +ifdef CONFIG_LTO_CLANG_FULL
> >> +CC_FLAGS_LTO        :=3D -flto
> >> +else
> >>   CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> >> +if CONFIG_LTO_CLANG_THIN
> > This should be an 'ifdef', not an 'if'. You copied Yonghong's mistake:
> >
> >    https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
> >    https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linux.d=
ev/
> >
> > Please slow down and test build your changes before sending them. Each
> > revision adds four new emails to everyone's inbox, which is just noise
> > when there are obvious, basic problems. 'b4 diff' shows no actual
> > difference from v8 and v9, which should have been caught by a simple
> > build test right before 'git send-email'.
> >
> >>   KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility =
-mllvm -always-rename-promoted-locals=3Dfalse)
> >> -else
> >> -CC_FLAGS_LTO        :=3D -flto
> >> +endif
>
> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be removed.
> See llvm patch
>     https://github.com/llvm/llvm-project/pull/188074
> which supports distributed thin-lto mode too for reducing the number
> of renaming. In other words, for llvm23, both in-process and
> distributed-process are supported for thin-lto.
>
> >>   endif
> >>   CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> >>
> >> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
> >>   CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >>             modules.builtin modules.builtin.modinfo modules.nsdeps \
> >>             modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
> >> +           vmlinux.thinlto-index builtin.order \
> >>             compile_commands.json rust/test \
> >>             rust-project.json .vmlinux.objs .vmlinux.export.c \
> >>                  .builtin-dtbs-list .builtin-dtb.S
> >> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
> >>      $(call cmd,rmfiles)
> >>      @find . $(RCS_FIND_IGNORE) \
> >>              \( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -=
name '.*.cmd' \
> >> -            -o -name '*.ko.*' \
> >> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
> >>              -o -name '*.dtb' -o -name '*.dtbo' \
> >>              -o -name '*.dtb.S' -o -name '*.dtbo.S' \
> >>              -o -name '*.dt.yaml' -o -name 'dtbs-list' \
> > With that addressed above, the series survives my basic LLVM 22.1.2
> > build test with my distribution configuration. I'll provide formal tags
> > on a properly tested and fixed revision.
> >
> > Cheers,
> > Nathan
>

