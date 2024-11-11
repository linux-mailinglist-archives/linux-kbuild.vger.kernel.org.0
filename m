Return-Path: <linux-kbuild+bounces-4648-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1FE9C4948
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 23:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8082B235F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 22:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD5C1BC099;
	Mon, 11 Nov 2024 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ElFowb/N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9484715B122
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Nov 2024 22:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731364760; cv=none; b=TxsNRTrMtc2CHXYbNlNF5y694CmkQ2gpqWB2byPKjafFFv+1nOSzOuYNdX2A0OYFgcYBv5RndsG6fZ2Vx/fcU8nwGviafO7rRleMEp11/D/HpiQbj+MoBokUqFEqUKxbr14XBWEk8SvhzcB8BZBdpDsVSkg1GWyY+CJ5IWI4tTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731364760; c=relaxed/simple;
	bh=eB8Ofe1WFjYWH1BdIe5Spco+AoLzN0kxnSrTkBUA88Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onomI+JHiE+H8omtZYRu1BWjGw6ngCDN6jvXUx6ysFr2l3SqCOu2oilUKirW/Ik896BHskAhiKtvB3YpbAcn1k3Tka51gMwrHiYnQIoU/7TpMTVrMYk8pZO+twtg8L/LNnQCffYT1tRnn1vC9PniRAZFanwsD9PSBihF35cW/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ElFowb/N; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-460b295b9eeso30641cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Nov 2024 14:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731364757; x=1731969557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2kkJJPrMSags8YoRSR8VcHdm0Q+fmhGso6Vl4PBlQI=;
        b=ElFowb/NgPe/jS82S+DSq04OF/+AhB0hsJ/zYlYGqqxuiTV0mtgCTfcFjXsisOwPTb
         z5UqXl0EhddAMJJU09DTyNsIZCyeO0kfCMfMEBbzw2b+n62Icfb60Y/gV/NMrhgeEIv4
         Vzv170Dx0lZ3hiIV9K+krTcJuiqVwQljZLGH4fl/mwjr69IFueFBP/UwYv0bAndhnFwm
         K2XOo4U9BUlm2ASBmnNOpbX0cC/LJsWBKHSdTwF6hOI/QO7jUEcnjA5vXhZp1I01hy9D
         gigDm9ZJUNwI80TY0Qp8HHa44x3i6v+4koyBcMPdDL6BL6aIFaaYoKaQstnikXYcF9y/
         C7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731364757; x=1731969557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2kkJJPrMSags8YoRSR8VcHdm0Q+fmhGso6Vl4PBlQI=;
        b=rW0LB1/kzjjhUDGQJovD5dFcuMeGyIARMBxc7dI/q1Lcj0PAbT9xRE3stQktGpn40w
         kWV1LjswntKdyiX1atLraegnh4ogdFkebU14JO7JV87Z7kPF0mIgQ65IQg6feKA4aDJz
         lP1on+9JJGWRSUfQegljrFwis6n4lCOvYjcYZqoZyzNdQUCX7H29ygoFPvU8gkWoZu6B
         RqsY9zLv39Tp2IVKGhARagTiUMjbtrHHrPtkxRmBntwRG3j7AfgSs5wGKXC4xozexi9U
         O+1KSThjwO8dLe7UBqDsekRyv/PSODFBIB4DFHzO9PSGjPONxsYlxnwpkrOKioVhPg9P
         lJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBnvboLoovJkGGKS15FJolff0o2Qeew0vJwSSLPBhgRg+kfCR0D8uZwiR3599gUIZuqF5idnJcn2YBVP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Ur0DE/oW/Y6inxPtpsXLFJZYFC+EqLasuvVgt1GeYBt6oE1t
	Wj+lNl60AVGEPOeLZHV4t7MelXv1Qe0uUhCe7UysQgzIr4YMTV64ERo/6AJYhWnFv4V0FO/rpen
	I7GB++mRgDARSsxuUMwbdCqOHU/4xDMRSdr9I
X-Gm-Gg: ASbGncuw1K+h3p6Xq8dXHpLSAf/rJULIAb6fs+//iQVDaEd0mEf3Ur00LEhXPcsCHld
	QOJ24yIb64iLEiSm0JmGV6n2BW9fAyRqJRij9K9QklnTIftoyoh0EIAfxho7dTQ==
X-Google-Smtp-Source: AGHT+IGWz5fxnaCrLCNd/OH6jFNg44ylUdGuht8uH/3QX9IXKi/RoL7fie/C49RsOcadfvZfnBz8SZRoCkm3npHj8KM=
X-Received: by 2002:a05:622a:190a:b0:462:c96a:bb30 with SMTP id
 d75a77b69052e-4633ef60502mr1176031cf.2.1731364757391; Mon, 11 Nov 2024
 14:39:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <44193ca7-9d31-4b58-99cc-3300a6ad5289@gmail.com> <CAF1bQ=ShjoEQZGPjDoy_B6wZdD_jr-RevVXwEDPA_-o-Ba0Omg@mail.gmail.com>
 <e7cd2746-0ad8-452f-aa12-e3a37e8a9288@gmail.com>
In-Reply-To: <e7cd2746-0ad8-452f-aa12-e3a37e8a9288@gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 11 Nov 2024 14:39:05 -0800
Message-ID: <CAF1bQ=SYeeKLUTfbqw-KH1rHJCj_CfJBuk+mZUrnnb7aDjRV2A@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Klara Modin <klarasmodin@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Maksim Panchenko <max4bolt@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Yabin Cui <yabinc@google.com>, Krzysztof Pszeniczny <kpszeniczny@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, Stephane Eranian <eranian@google.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the new System.map, we have:
ffffffff81112400 T _stext

This looks wrong. It should point to the beginning of the text, like
ffffffff81100400 T _stext

I'll do some debugging on this.

-Rong

On Mon, Nov 11, 2024 at 1:32=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> On 2024-11-11 21:43, Rong Xu wrote:
> > Thanks for reporting this issue!
> >
> > I'm assuming your kernel build enables dead code elimination and
> > uses the --ffunction-sections compiler flag. Without this patch, all
> > the functions
> > -- I think there are only .text.unlikely.* and .text.* are grouped
> > together in the
> > final vmlinux. This patch modifies the linker script to place
> > .text.unlikely.* functions
> >   before .text.* functions. I've examined arch/mips/kernel/vmlinux.lds.=
S, and
> > haven't found any obvious issue.
> >
> > Can you send me the following?
> > (1) the kernel build command
> > (2) System.map without the patch
> > (3) System.map with the patch
> >
> > Best regards,
> >
> > -Rong
> >
> I don't set -ffunction-sections explicitly but it seems to be used when
> I look at the .cmd files. The build command is nothing fancy, I just set
> ARCH=3Dmips CROSS_COMPILE=3Dmips64-unknown-linux-gnuabin32- and build wit=
h
> make -j24.
>
> I've attached the System.map, built on next-20241111 as well as it with
> this series reverted.
>
> Regards,
> Klara Modin

