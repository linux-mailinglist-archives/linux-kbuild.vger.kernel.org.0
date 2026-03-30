Return-Path: <linux-kbuild+bounces-12354-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGiVFHpsymnG8gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12354-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 14:28:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561535B098
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 14:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3795300459A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 12:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06D713777E;
	Mon, 30 Mar 2026 12:24:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA4F3CB2FD
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873445; cv=none; b=eb5Jf2Ojg3gmccTXiQtiIbA/ukjjPvA1wzMwCtB8iphg1I4Vc2Mdl27iQglr86MqD2sxvPfnt1oZ4i3PgqemZcA9AoVUzr8O7AkFu8sw4g+T9u9FsoCjQxc+tUTdEwHrOtwT54cRSGyauCCYxx93I1IIW8J0xc9Ppr3VBqMNKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873445; c=relaxed/simple;
	bh=mA3ZR1DLbQrQkL9PKCipYpYPc8aTCrcmFCztxVCijFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNAd1BhOhfLQ+pN/7t9y1R7kEnMKgYGR3a8zmaidtzLat99nIccaE+lQuBtJ5o125eTM8Qz6H26XOGRgIPNtpRSkEVPcw+qYjI0Ju+ZIGCj+4wkfN6tL5/jBXAbhu0evg+pRtb5pnjsPDOJpYYs7QCn9fDgFNzFYZ+lJ5+XiBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-404254ffe8aso2634967fac.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 05:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873441; x=1775478241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woUempTeRL+MJtlKxpfNaT94H+rNPuTZjIMDTveSMCs=;
        b=Cf5pQ7aMzeM6scZ4g1JWPCtIF9gpHv1ryxRhqh2SdbCs7vb/rhs5gYT2k2hcLv8NJN
         2LLCtoPy8Nbu7uT3yb2gwfLBZ4Wu7EimKj/vhjM+20CJ8QTGJfUMZIzv1Eh1V4oUJ610
         gszzExc7Ur44qDZmVdY3CaZIJBnMsgF/B02UXzg1HX9pUfzwI1VLv/bqPX6wbJ7OIvNr
         x0+r8btvvALbEfalj9DyHlP/UBFxCorhUEj0lx2tuGKbcBcjs5GpRO4tUyWLg/GIEm15
         VmqF66/+R+q3h38F4R4M6kakOG97P6ogbLPVtByzn934rYJgW5hp1VmbPUjPZtmYcpPl
         BHVg==
X-Forwarded-Encrypted: i=1; AJvYcCWfIfTzxGiMW54K26XmmK/6Afzu32WX84MIfDPr/pZ2qdkVfbBMzvTOAjqJ0bat1tNLIGrke4OG9nhM1+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCxojVHSNmT9c3YrmAnyhgi4e/JAm4pNsh49QJbNY9wqEmQnVw
	eh204kmi1W4YpobXLcXPUU+oa79WN7go8oLHhvnaS3FJ5d6DNq0N1i0+MTas8Q==
X-Gm-Gg: ATEYQzxvk+1EYpanz+hd19/lXd/YW047DSNlssDnO/McMkA9fqkHleda/Uzo9WjuFG7
	hIwPeGskGpQuRwqcs7TjVEpb6Sc9xnszwZSBgYlIEkr37QH8ZBTv2q6IS7dtn5yhw9dHx3XdKin
	kPG1WuqXDhVQUpz4UQQX4/UUV2JLLr4Q5p8cYB8sOod0aSdvJoQ/kax9A/oT4DKVY173Y0hQFzF
	X07JuFiVgGTojLDYdGiu6C6WDQ6NkhpSR9JxX3m+mENidsK+irq4jE5ytS/Gcl97ra0TpkPH6EC
	/S0vXlWUThk11Yc6/hzNleU/AsHTXxTAcAcBzyYUvZsqkaQBuhaEtuCLoUtftK7NUTC4f8SLzy7
	G+DuWmW0tT9fD0uDEOowGlSRcwpDgn3n4rlpyo5oog4GFzxyJ3HAEB0FMhKulg31QgbIgWbNvys
	K5bxWKVyRPrKesllHGhcTpD/MOerbRjplr+TXy5kMT4Fp7Xm0BJr3TwFwAtjWDvQzDFXybo9E=
X-Received: by 2002:a05:6870:d14e:b0:417:4c6a:3e87 with SMTP id 586e51a60fabf-41cd7e0e11emr7813402fac.26.1774873441404;
        Mon, 30 Mar 2026 05:24:01 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d048e483fsm5169813fac.1.2026.03.30.05.24.00
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:24:01 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d9b21d1461so3852220a34.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 05:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDqjFaLejLwsKeYn0ZenEKcjcu0LhmWFXRTubTa4FwVCEFPIrlRoL1fyt/z9ssWtFBx3UgKmdkC6V7AB4=@vger.kernel.org
X-Received: by 2002:a05:6102:4498:b0:602:896a:84ba with SMTP id
 ada2fe7eead31-604e4df3704mr5271926137.17.1774873037674; Mon, 30 Mar 2026
 05:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com> <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com> <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
 <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
In-Reply-To: <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:17:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDy9mNuzDaYfE6r+P8MSTBEGsyRzisLF_d_FWX+6qCVQ@mail.gmail.com>
X-Gm-Features: AQROBzD1En3iKQ5LsAPqOXpbj6O32MjUPo3QPwr0lgIQkMqaR2Lx1_ZSwol-K3A
Message-ID: <CAMuHMdWDy9mNuzDaYfE6r+P8MSTBEGsyRzisLF_d_FWX+6qCVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
	Gary Guo <gary@garyguo.net>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,google.com,kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu,physik.fu-berlin.de];
	TAGGED_FROM(0.00)[bounces-12354-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: 9561535B098
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arnd,

On Mon, 30 Mar 2026 at 14:14, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Mar 30, 2026, at 14:03, Geert Uytterhoeven wrote:
> > On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
> >>
> >> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
> >> thought this was related to this 2009 change in both compilers
> >
> > Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
> > have any bitfield members spanning multiple base type instances in
> > the kernel.
>
> There are certainly very few of those, but two example I found in
> UAPI are
>
> struct dvd_layer {
>         __u8 book_version       : 4;
>         __u8 book_type          : 4;
>
>         __u8 min_rate           : 4;
>         __u8 disc_size          : 4;
>
>         __u8 layer_type         : 4;
>         __u8 track_path         : 1;
>         __u8 nlayers            : 2;
>
>         __u8 track_density      : 4; // crosses u8 boundary
>         __u8 linear_density     : 4;
>         __u8 bca                : 1;
>         __u32 start_sector;
>         __u32 end_sector;
>         __u32 end_sector_l0;
> };
>
> struct usb_raw_ep_caps {
>         __u32   type_control    : 1;
>         __u32   type_iso        : 1;
>         __u32   type_bulk       : 1;
>         __u32   type_int        : 1;
>         __u32   dir_in          : 1;
>         __u32   dir_out         : 1;
>        // 2 bit padding on m68k, 26 bits elsewhere
> };

So we just need to make padding explicit? Sounds familiar ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

