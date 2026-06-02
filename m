Return-Path: <linux-kbuild+bounces-13504-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rAOBINILH2qJeQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13504-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 18:58:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D32536306FF
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 18:58:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=vwovJoQL;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13504-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13504-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20F4B30A1A85
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 16:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9423938237D;
	Tue,  2 Jun 2026 16:51:43 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2833803C6
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 16:51:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419103; cv=pass; b=pJvn3/RAJW5BqABpFdNHAfcdQNHR1wMhyp78rW0ntVeVPoER/M/yWcAvFv6gSEfIUGF80carSmG9LYbNQ6pEE3BQio6e+va/mEQvGgJgfqMtEyJvyqCSYPnzThz0qW7spikIqivehUM/sovAztB1ocFhFZs8Y7nOtXUVpnUdBPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419103; c=relaxed/simple;
	bh=HNPBgKw5YVMpk9odXIMiTm6obkXACvlE1PDWRPIpSP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=aFzgxflxyhv2vDRwI5Wt21xWmzul2gfl9RNcdibGHMegAITX6xuYbbPHtT3475oQ0WeM92xufK6uMTAaDf3r3okbHGgbHzvY2xb85LMcg0PgtTtQBvy+hPELrsk3FHq0+odKmc6LoIGJedd7cR4kYr06mlKf/v4aMBZRLOx1omY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vwovJoQL; arc=pass smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so229a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 09:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780419100; cv=none;
        d=google.com; s=arc-20240605;
        b=iyfmnCI0OM5FklOeaLl9W8ouTfjQC5P/l3s/jnmq1PvYctsmgjzYbA0n2lN2xamLqV
         pWcyFHQc7cRL2K7qgj/0xMz1GQ1uURDPwVhtPd+sQLWJyrspv7d4zvjgYi+3ZYqkkRaf
         VtKXWb030VDkUQnicKd8L+ws3gRY/IV3r+LYkXsVfHgMexg5cYs9Sv8k5dQF9cUCigqd
         3AOZ4JWn1k1UhqnWu1vzd2gq3bNEBzMmkJQ60n2+AWiEECG+ugsAKTwtCXu+W0nwgXvF
         zWhDPctHevdWmFlSJ5aeiVg18D7Dky6YtiPJy+m2fu7QZANE5U/QOobTIOhvi0FjcMqI
         6IaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1W2WHXzXyTxWh2ygyWWGHezvuq5VRVO/z3z5aIeeeQ=;
        fh=VLOA42jdp8MaSkWGXNYgBjYdMJvxGzfLAZltTvIzBDU=;
        b=DVpVROaW5kwl3PTXoaCiKff0x36pGT06FvxNSqrs+h66iWOqISsBGv7F3ac8BR9aTK
         5U9V2AFk9A6U9fa0SBRuZY9YtnQoVhSG5J9E9wjxPV+Oidsz3f1aNz1+RawSASaIID3U
         Cn2E/dj3Fg2A+WK0zoeCWBlBPOyD2VxshTbdZ47ggLNzZ8OC9YCV8FyIyf298KcVMVrz
         nP1ZnlsO6U7T3qHBFRrPl06BvGUocIPIOK0SdclH+84Ol1rbjMi8fql4lH1lcHMWcOI0
         XiSrAKxy5DzQlN9Zc2eQAGnxNmo6cIVlk1bNM21dq0YNunPm5Pod1G3qL/H4KLrtOLTH
         09Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780419100; x=1781023900; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1W2WHXzXyTxWh2ygyWWGHezvuq5VRVO/z3z5aIeeeQ=;
        b=vwovJoQLD8Nu+DvH4cBcJ3YBPwMqQ75UAUTEzTtrF21ihw0kOu21dtw6EKCC+gd6WR
         jJdds9rsh3Or52OUGfeokHzT7MvBbubaMEPpn6Ky6f4KXPSuR4CpBmALBSKaFBeElihf
         8luw/uMkxATaTxbORZd3uytOJ26l7rDGr0Vmj9pxPk/pZAGc1ujYw9dp9RjN32UHN5up
         G11ZNyw/LL4hzOgLCIyTfN9lXpXFkMAYuayt90X8P4FPOsNhPfx1Jje9g5R3VIZVjIgJ
         7VEft5Jl2EXT33mKr/tNOW2NLgaJYT+RYsZFr1O71Cn3G37jHoDG6SjA+IywItbNFOr2
         rEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419100; x=1781023900;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t1W2WHXzXyTxWh2ygyWWGHezvuq5VRVO/z3z5aIeeeQ=;
        b=NclNF9pTbPuBilKKWc4dwaAoPvC83MHPGt1GuJ9t9/yW5OJXACGqJoCQA7HZ85rTeR
         6c+78pmsgioRBg4akxzSez50Bjxie6SYgcGjq7z1f1BR+wY5cpihwnbowNE2n5Ffj/WM
         SOsn3RATdKzq4Ilsu+GXcYBrjNeKOwgx1jlQUEN5Zd33zMNdhE0bbBCEoY+WbJ6gqWbl
         xzXTaQzj7WZLzeFQ8pIHnqVXOm77ARu5r52n2ZCLeKCcRw8NfjOmBXRI+fOK9x5igG8k
         pcjl9Owa6WbVyFJ5LyFyeEeJNJWjPV5UOvUK0nffGlkzEHRA25RuMxpY9JWLuz3nfVer
         hOgg==
X-Forwarded-Encrypted: i=1; AFNElJ/aO2M16j5ItynJ7MNC2gkeU8GwqP7YsUOzUcav0OFVMabedjlKW1dhatamXszyEs5g+JWA1iYihRFOEGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSuxcBXJpdYh0og50Qyt/H0PpVl5o8nwJD9TfXQy/jPZf0AnS
	CHDbJBjzlu3gxvg8B+hzWtXhlKUyLHZXBVxYIFNy2qo2VOEH1rHDSun/qydQhq0Vxt7nAv6OwXW
	E+f8xQTNnx2nBNDnI4Xl8jG4NrxMnyzltzdpi1+GE
X-Gm-Gg: Acq92OEAtG+FxJq7jbD7J3bdaDFylVo38B+atUXWHsvFn68cq9dJd0rS1Dxj08CR0pA
	NO/4K7rqWPtA0RCyQ/hu1sm0ov1yyE2eXpgBTOFsz4iQ6F/AVCJh5KUx6fABFKj0NQpd+lDhbuR
	fs8LPnhNUAQXb0zBocemHM2OJIs4Hx+93SJa8fPJSD6pTfOZF2hUCDEJLYwyFo9JBCy7tss7sOY
	pFMO3bkJCaYY80I3XZeFAQdW+ARNDYcQuFrToGLWZK+55L+y/GWLVlYm2iZLb3yH/csKIycAF+7
	/hMZtMRGGsc9oK+H7Ns6XNfchIMkg6qZ1hM81Gj24krlF9XJ
X-Received: by 2002:a05:6402:21cc:b0:671:fff6:f82c with SMTP id
 4fb4d7f45d1cf-68de2cae1e0mr153594a12.2.1780419099976; Tue, 02 Jun 2026
 09:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529185347.2418373-1-xur@google.com> <20260529185347.2418373-3-xur@google.com>
 <ah6DleoCYipTwcO_@levanger>
In-Reply-To: <ah6DleoCYipTwcO_@levanger>
From: Rong Xu <xur@google.com>
Date: Tue, 2 Jun 2026 09:51:27 -0700
X-Gm-Features: AVHnY4KWNrtfZLBePBwjMl9n69nIbQyBupMH9nSIAiZnSkTtznVpBFkWF7l1BcM
Message-ID: <CAF1bQ=Q+KN+p8RmmVDF3bP=11EWj=8fOPBg7wa7QQRW1XWF4iw@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] kbuild: change --thin back to 'T' in $(AR)
To: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Bill Wendling <morbo@google.com>, 
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:xur@google.com,m:masahiroy@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:yonghong.song@linux.dev,m:morbo@google.com,m:justinstitt@google.com,m:ojeda@kernel.org,m:tglx@linutronix.de,m:aliceryhl@google.com,m:samitolvanen@google.com,m:rppt@kernel.org,m:aquini@redhat.com,m:mpe@ellerman.id.au,m:shorne@gmail.com,m:christophe.leroy@csgroup.eu,m:piotrgorski@cachyos.org,m:venkat88@linux.ibm.com,m:miguel.ojeda.sandonis@gmail.com,m:tejohnson@google.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[google.com,kernel.org,gmail.com,linux.dev,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13504-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D32536306FF

Thanks Nicolas for the review!

It looks like Nathan already merged the patch series and squashed this
specific patch into the previous one, which
removed the commit message and that comment. These changes actually
incorporate your review feedback.

Cheers,

-Rong

On Tue, Jun 2, 2026 at 1:46=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> On Fri, May 29, 2026 at 11:53:45AM -0700, xur@google.com wrote:
> > From: Rong Xu <xur@google.com>
> >
> > The '-T' flag in $(AR) is no longer problematic since the minimum
> > requirement for LLVM has been updated to version 15. As of LLVM 14
> > and onward, the '-T' flag functions identically to the '--thin' flag.
>
> For correctness: it's called "'T' modifier"  (instead of "'-T' flag").
>
> >
> > Fixed the issue seen on IBM Power11 System:
> >   ar: unrecognized option '--thin'
> >
> > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > Closes: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c=
1ecae82d@linux.ibm.com/
> > Signed-off-by: Rong Xu <xur@google.com>
> > ---
> >  scripts/Makefile.vmlinux_a | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
> > index 9774f02b43b2..650d44330d1f 100644
> > --- a/scripts/Makefile.vmlinux_a
> > +++ b/scripts/Makefile.vmlinux_a
> > @@ -10,12 +10,12 @@ include $(srctree)/scripts/Makefile.lib
> >  # Link of built-in-fixup.a
> >  # --------------------------------------------------------------------=
-------
> >
> > -# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <=3D 14
> > +# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <=3D 14
>
> This comment should be removed.
>
> >  quiet_cmd_ar_builtin_fixup =3D AR      $@
> >        cmd_ar_builtin_fixup =3D \
> >       rm -f $@; \
> > -     $(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
> > -     $(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | gr=
ep -F -f $(srctree)/scripts/head-object-list.txt)
> > +     $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> > +     $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F =
-f $(srctree)/scripts/head-object-list.txt)
> >
> >  targets +=3D built-in-fixup.a
> >  built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt =
FORCE
> > --
> > 2.54.0.823.g6e5bcc1fc9-goog
> >
>
> Thanks!
>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

