Return-Path: <linux-kbuild+bounces-11978-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI5mLghuuGn5dgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11978-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 21:54:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3E2A068F
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 21:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9365303DAAB
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 20:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9B735AC03;
	Mon, 16 Mar 2026 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1kaXlKN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716535A38E
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773694424; cv=pass; b=Q8bFtz6dOV9E/Ewn0QTZRmgBNU/YLT3oG0VbFOUox47UzIrgn7bhp99LPwA7ytxy3llJl4OMoG2dJDETZdim8cCwEI94mq0hkBCt8FX7Mmqzxo3Ghadpe32VB3x+kdhjN5gXHucJcMgG+IOrQhSv8Vp8DuvIwgmtOSJIShjCDFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773694424; c=relaxed/simple;
	bh=xjEiOlby7+X1jtjWnQGqc/QCdHpRI0DPUXAfftw40i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET71yWirYvIq/O90G+4PE18ToTMUqwl5YW2JbRNfiZy0TQmsGc4YvrO7wljzFeHajc7s1cSfz7w/CMOE8fsPihIhi3yIRo33IwY3XqLa/q58TEQWKnFgr9TWnpv9Qj7P+oW9jm0n1MpjKxGeLa4EcPU41GG0SAwkzwIk1/z2hsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q1kaXlKN; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50906a98ffeso186321cf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 13:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773694421; cv=none;
        d=google.com; s=arc-20240605;
        b=gMIzpVfcyPcTqkjMibEA27FoM4M5XWzQ4MacDeYSWgS8u7gqdh+3nrx88wW3NrFX6A
         fIU3CGJEfR8lNQXKAaXOZuiv1qIdZa1nTi0klZ/bVPomenP8+dWUecDOzfXAcTnwWUd1
         mF/QkmIw9iJvG9INAxu6gAg6JKVXp/hH68tnD5MVSZ/YOXjS6bMGp3mTaFkWR5FNSi26
         g3ybpH0B4gyumYtbPyjEaI0obpTQc7C77rx4Dl7V8Vpn3xKcB3nHYIo6bIpjncdjHcIx
         yJfjxzOyy+CQLJO53OQt29KvGpjYOwx7wHwrvesojWi1IMswMZrIiJyDhIzn3sB2AUUL
         c08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZocTuzrj+ejnQDANUISisden0pPpKZ7pf1lF6A4WE7w=;
        fh=bo3XSk0yPXW7+n9Z00imBEUXrxokZwbhNAefRVgEzBI=;
        b=YbRHNlAxACcINOfJRQxs3g6/dlgiFnZV+rjoF0rr+/RARkeoEl+MDG+CtPoV//x/bi
         Na4awCMEyQITA6jTjq53U7IIzVVGDZ3VPUtmKc0K9dHRbOZDBQqVnNwJNwpq9UldIRSQ
         iefnEdcdaXZ/db1hEnSyvEDJeT2ZiUGk77A4emmd1/28xwWqtsSUCiZGVg0CrQoENtJ5
         jaj5oQWkEsXslp2HUCgsZglGukubSmvPPdnGwogcy0lPKPsIWdGcS9YnXQVQ2IMCqXdY
         vjV/byMRbeD1cgXavmRhngITadU+H1dlxnD5qj6UuDdiv7Hzyq9KT+Hwyk8fRp9b1UJO
         9mHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773694421; x=1774299221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZocTuzrj+ejnQDANUISisden0pPpKZ7pf1lF6A4WE7w=;
        b=q1kaXlKNL68i/OjCUeSuvljvjyDyUz5V265TJnacdKZtQJsNtdk6oNDDgs35vun3Mc
         Hgw+cofPqWLxsvNGivG5N9AktGnk5mC7xepet0YnwPSrbcj2UBkNcaalugPS3yyAropX
         WAPuLYdIRcYRZOrS9USRHqQYRuDUQ1R5LonJSkWNi0I/h6W6dl3MzOJ6R0qwrxnUgdQc
         UqI/S8QFPoKeghu+DU3NEQsvKP+lwc0CLDthD1b1ogK3ggMI5T3tg/PJkMYqMLc4Jhoq
         7Rx/gEr4TOfj0I/x6jO6cIz0pvYUdkBxKmlUwB1wztxCX82DC9lLEvQDpZQFZ+s27I8t
         v8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694421; x=1774299221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZocTuzrj+ejnQDANUISisden0pPpKZ7pf1lF6A4WE7w=;
        b=QrYxFU+dFtVcapJz5SigWY6crpJay0VxE7qmCSwez5G+ElsLrgqKQKYdaCmkxA9gAF
         6GEPGdR+H1WqWb6Ry5yrxS2tbo/+4V1FmMCrHCxFvxS9mjTKMa09a/AjajX8tnBzwoR4
         jhNpe66UqHyuXi2D2GQ/vxeKEbOCsujV79tq6NNH6PV9ZcfajBOZWrFvIJ9I2K3SsrcD
         lYz8Q6ACVXBLmkAK97uUxvyimlYz5M7XTWGdW5iA5hBaaO1BVFaAMkeU6ob9avrUiZuP
         H5k4hfq0RGwrD3iYAvU2ZXVIs5SBULTNR0tRtlq7K3Z2hESBqwiXi9DgwO6oMY/SylvA
         2/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9OJTJCOiD6pQ0aW7hoxxeWQQJAHLRtae2FsCJohQny1o9Zqmq/JpLctYX+cXRhBdcOwPPNBFQ/okhaLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCHIOe+EeHl03AA748ExwTMu4+aiAOSzhiRQInUFF02oo+C+s
	lR/rjYJAJxsdtbQg0+NjBN1tPTRefVVWQUeHpNCaoci+E9437v832+fcxwIDHSn4LE3bYu2hFI9
	jzl54bltBWC/J68if/q8Xi669Kdy1HFnssbge+715
X-Gm-Gg: ATEYQzxgMzEZtvbrQ3ZJ46cLtzfSZeNCwGguLnoP3jJgo99vdZ71jNzLB/KN6/4t4BL
	ez8LmVjxtKNwjTJhW9fk2Bgd3CK/6zfYc33AOYk9wnOlrIw4STohR4XMk8IxQXP3qlOjmxaXAat
	MVMxb7CX013RdNaIoXBL7aou55OXNKizL68zg0uxLtWDhHLFWYqmC78Zz6QYm1kVwC5k4Pzr+c0
	pYLyi7mw7BqVPu282gqEHkmNrUgz2GVpuCcOrbaFWfzhB207yTNoQFmFfgFZIpBIsVDnC23QIFX
	vxpVvZ1zct9kdaRCoaAL1LdXVMUTQjyBfI8=
X-Received: by 2002:a05:622a:1b92:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50998c190femr3930831cf.2.1773694421158; Mon, 16 Mar 2026
 13:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger> <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
 <20260316175953.GA1910339@ax162> <CAF1bQ=TqFwmm9NhBPnxaoTCqHOsm1Q6MLhNcqpYq4uObZxzk3A@mail.gmail.com>
 <20260316204311.GA1329928@ax162>
In-Reply-To: <20260316204311.GA1329928@ax162>
From: Rong Xu <xur@google.com>
Date: Mon, 16 Mar 2026 20:53:29 +0000
X-Gm-Features: AaiRm529X9bdSOVFyuw_ffkkUdRVI1I88YIwCTJrveYGGmKOjVl-6WwEUJdSeVU
Message-ID: <CAF1bQ=TPeLOmRTMcgjVCz2QsJxT4t1FcabPU2ZX2tnanj_QRsA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11978-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D9F3E2A068F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sorry that my previous email may have caused some confusion.
What I really meant was to keep -T (not change to '--thin').

I think Masahiro's change targeted llvm-ar (<=3D 14), where it uses -T
for "truncate", rather '--thin'. So he used ''--thin" explicitly. But
this "--thin" was not implemented for some old ar.

Since we the minimal llvm is now 15. The '-T' flag in legacy llvm-ar
is no longer a problem. We should keep '-T'.

-Rong


On Mon, Mar 16, 2026 at 8:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, Mar 16, 2026 at 11:16:41AM -0700, Rong Xu wrote:
> > If that's the case, we can just remove flag "--thin". Can we verify if
> > that works?
>
> I think we can only remove it from the second llvm-ar invocation. I
> tested
>
> diff --git a/Makefile b/Makefile
> index 2b15f0b4a0cb..fb001e02cc0f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1260,12 +1260,11 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
>  KBUILD_MODULES :=3D y
>  endif
>
> -# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <=3D 14
>  quiet_cmd_ar_vmlinux.a =3D AR      $@
>        cmd_ar_vmlinux.a =3D \
>         rm -f $@; \
>         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F =
-f $(srctree)/scripts/head-object-list.txt)
> +       $(AR) mPi $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -=
f $(srctree)/scripts/head-object-list.txt)
>
>  targets +=3D vmlinux.a
>  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
> --
>
> on 7.0-rc4, which showed no issues. This is basically a revert of my
> suggested workaround for the original issue:
>
>   https://lore.kernel.org/YyjjT5gQ2hGMH0ni@dev-arch.thelio-3990X/
>
> You could add this as a prerequisite patch, I don't think it should be
> squashed into the move change, especially since that appears to be why
> we are in this situation. Why are we converting from the 'T' modifier to
> '--thin' in the move patch? I know the documentation of llvm-ar and GNU
> ar says that 'T' is deprecated in favor of '--thin' because it may do
> different things on various ar implementations but the kernel only
> supports these two implementations. I think we should just copy the
> commands as they are and address the deprecation separately, perhaps
> with an ar-option like Nicolas suggested upthread.
>
> How about a v3 that looks like:
>
> Patch 1: The diff above because all supported llvm-ar versions do the
> same thing as GNU ar.
>
> Patch 2: The move patch without changing 'T' into '--thin'.
>
> Patch 3: The same as before, perhaps without '--thin' as well.
>
> You'll need to base on kbuild-next-unstable [1] to address the conflict
> with Yonghong's "kbuild: Reduce the number of compiler-generated
> suffixes for clang thin-lto build" [2].
>
> [1]: https://git.kernel.org/kbuild/l/kbuild-next-unstable
> [2]: https://lore.kernel.org/20260307050250.3767489-1-yonghong.song@linux=
.dev/
>
> Cheers,
> Nathan

