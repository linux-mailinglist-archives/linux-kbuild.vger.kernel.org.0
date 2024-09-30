Return-Path: <linux-kbuild+bounces-3842-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A90CD98AE70
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 22:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC01A1C20CCF
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 20:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9E51991D6;
	Mon, 30 Sep 2024 20:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QqCr3/Uv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10F17B50A
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Sep 2024 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727728536; cv=none; b=EvKHc0uNQuVoj3ww7Ba05kScOCB5GQm6QT5shmC5V0DFpdEJRCZVT5+5ZYDAQeeH5de9/iuATjagOsF/DFm0a1U8yqPXrtIP7KAEhWiHQQgl9WIqQOYOqhfQrjWSFet+C/0YUz25/zeUWEFqpRP/DZAdqNcfYMZFJm2C3g8sfjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727728536; c=relaxed/simple;
	bh=EvGp6sAlZk0VPl14kVuQt5lwWnwxjx9HOSoTel6dY4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9WDpxeKlSD929UMeIABjPGtdZlLibuqiJJ7Zp6onk8Iy8I6iBgFLaaN+5W4+ysli4qDxBr9M4jnX86YCoAy6CCcWtD5xQnnffIe4fG1PfsP5/KULFprWPE7BPcGnamHwn4tBvQ+GECk9taOkMY9TIPLZUwHD6BA5zLtQxFtv1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QqCr3/Uv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20b3d1a77bbso52045ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Sep 2024 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727728534; x=1728333334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvGp6sAlZk0VPl14kVuQt5lwWnwxjx9HOSoTel6dY4M=;
        b=QqCr3/Uv4YCxNSUeMpNPN6XPz3JHWWI8xtNCnjPsxEVUw8EOsUII30B6lPtALpmrHo
         Y0pQUWq+qOTIQEEiia2LBvrCn3b8N1A6lmd7wgJ17SOHQrqrXwOzDS7CLu9pMhWZHLcH
         +a7kH8s9MlQNI4FHfxHzBE3pqwwbnJpHuLQPlf0hzQswPLReU2PaRent7Ts4tMtzjzMT
         BtDTcLl6donqXnrXqP9kbOR257wi5yoj+t9Kayglk/ETogU+z7ozBsfvKyV459Y0230J
         VupDh8xEAz/5rQvjTgeoBM1c1A94dtAFR+zRqoLeQY5bPrv5B8H/Avpg2xZfmhv9oLRm
         xesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727728534; x=1728333334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvGp6sAlZk0VPl14kVuQt5lwWnwxjx9HOSoTel6dY4M=;
        b=mXDs+lMrx4rozPFdF4pwU6zDxHBAPbmW//EN6QaxTkUjZ4zmDkEyQxrKWSEpsL53da
         OxYVOvOpL7+6HKaOgrt3CqUuGgtcNFpDC1AHHxfYxZpFweYDHQTp0DJEbRwSrqhmEl/7
         sCRhJsRS9KOAVMvntO0k+ndxer29GtoClfi+HODh9kLCrJ0G7Q5VbM2m+/8Y8RlJBpRI
         PzvsdEQ63f8EdUlgFvBkDNRMBu1DvMgyHkdSrTfyzSsZ6IzkKZ4aB5XNyEhdioyj6zV3
         aNXCdUirAHvOIiAhpab47BRtq3VLk46QyKCCCiilyB7eCZ/R4zucQaBMZEVHuf/oFzq/
         Rkqg==
X-Forwarded-Encrypted: i=1; AJvYcCU4yxuFHmoyFItf5ANX8HFQ13o/WqYxve8c0G4VzqiJdJ3PE5N6qcjKN2hy2P1e9h31S4ChgdEWHFn5rGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnQIJGpik2SFua4GgcJgVB8DoyJ3L70Y7Mdi4ZtcE7qemKOjaH
	AZfXtqFQDiXGEJfkiOIkughshTgHStGlFZVvxhyK+eGZdZVAu9civkyuUQgG1quFrNdp0+kecyQ
	nk9YyEU0GhQDVFla82ljrulYtkD4pCYNOphZ9
X-Google-Smtp-Source: AGHT+IFnbcGLNTwXNFovYgGJb47q4+smFCUzoLEdiETVHWauNimxOhjfQshZVGQxictt2tOdZ/N8cQaljX8vuQUmX1k=
X-Received: by 2002:a17:903:283:b0:20b:13a8:9f86 with SMTP id
 d9443c01a7336-20bad44e1camr740385ad.28.1727728534224; Mon, 30 Sep 2024
 13:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240728203001.2551083-1-xur@google.com> <20240728203001.2551083-7-xur@google.com>
 <c65a07ef-6436-4e04-a263-7cad9758e9be@gmail.com> <CAKwvOdm0iZspjpuueBV1=eFt+Bf4edWBZsDsj10kEvTGZRye2w@mail.gmail.com>
 <20240928173530.GC430964@thelio-3990X> <CAF1bQ=QoNNLVKRpaXyJ8pm+NcnSyzmpgAN5ktu=Fqim9HkF4rA@mail.gmail.com>
 <20240930202911.GB1497385@thelio-3990X>
In-Reply-To: <20240930202911.GB1497385@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Mon, 30 Sep 2024 13:35:22 -0700
Message-ID: <CAF1bQ=TPuP+ZLtdoKhBc-10HyHmiqROXwwMOWuEex5JFEMHa6A@mail.gmail.com>
Subject: Re: [PATCH 6/6] Add Propeller configuration for kernel build.
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, John Moon <john@jmoon.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Mike Rapoport <rppt@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Rafael Aquini <aquini@redhat.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Eric DeVolder <eric.devolder@oracle.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Segall <bsegall@google.com>, Breno Leitao <leitao@debian.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Brian Gerst <brgerst@gmail.com>, 
	Juergen Gross <jgross@suse.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Stephane Eranian <eranian@google.com>, 
	Maksim Panchenko <maks@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Nathan! We will be there for the discussion.We are also happy
to discuss any additional comments or suggestions about the patch.

-Rong

On Mon, Sep 30, 2024 at 1:29=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rong,
>
> On Mon, Sep 30, 2024 at 10:07:05AM -0700, Rong Xu wrote:
> > I don't find the Clang Build Linux meeting in the link of
> > https://clangbuiltlinux.github.io/. There is no Wednesday meeting in th=
e
> > upcoming event. Can you confirm there is such a meeting.
> > We will be happy to join to chat about this.
>
> It is in the "Useful links" section, under the "Bi-weekly video meeting"
> line. I'll copy it here just to make sure you have it.
>
> Calendar, which should show the October 2nd meeting at 12pm Pacific
> time:
> https://calendar.google.com/calendar/embed?src=3D47005f8f50f21da6133d7239=
f3cb93d1624d2e1949963ea75dd86d5f2d5721e0%40group.calendar.google.com
>
> Meeting link:
> https://meet.google.com/wrr-mxkn-hdo
>
> Cheers,
> Nathan

