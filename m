Return-Path: <linux-kbuild+bounces-8319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7438B1E0C2
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 05:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87ABF18A4B5F
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 03:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76CA17996;
	Fri,  8 Aug 2025 03:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwH9hehs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B7A3FE5
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2025 03:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754622178; cv=none; b=P0hxIF6QhcYqSbeMACfAS8H2/msQSj+Ui2iY5FtHonwady+kYo7DZW7YVVD9deJzSJ7+BiiW4oGExtUrcUpkr6aFCMJWJ1/fnFdPakF1N+Cu2j4QGHCp9enoyIYGDEFaviRWUMBgMV3nLYNUXNzCNKZoTwpVle4PoO6OnWILYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754622178; c=relaxed/simple;
	bh=Bl7qCFpvptluISdHnIZnTbyWsvD+rpVmzsesbuA36SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9tJjWTjNCROiweBLKcMOh7pFqRBwPu/i6a6VRM+egfZ87FO5/y5MwqpcG0LDR5+aReJxM+pshCbxF3Z/yczEHK8GsuQ4RQCe/hodsj/W5f8GFYIaNSpdCZfFT4Eier/Q7UNHSsXeVBo0ZGB2v1sLtPdV0AiqaP/FGjNmbh+V7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwH9hehs; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-43404e99955so1155155b6e.0
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Aug 2025 20:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754622176; x=1755226976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gjzRJd2+smPr51bhHFpGh1SfDjd6XJ9HBlgR68aXi0=;
        b=NwH9hehsfA9p1+C5p7WXqyggV6gU8mRWym0+EXUspx52OHnLwHo5kNXB56ohtF8jj8
         U6d5BnHWsDVKEQ/FHMZJdZjivBHrLGHr1HLvxiLO4/dB2wFfCqr0dlAbeirioqOLU8T3
         um6LVIDMULA5T8dIIJpARrp0P5C2n+BHZ0B2QItuuZEqZCq9THCrtl/2/cYXF2F5tqlD
         1F3+XVQn7UAm+533lLDCt3r3fpwBMk1FHIcdkOtuZI7t9ypFyIYQwwyPZIi/o6t48BT2
         iJqn6ToQZdZj61rye8T/szfejp+QaDnSxJ7bjDCGLLvqI/iEaZOW7/VX9xDOgXFUacnK
         H5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754622176; x=1755226976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gjzRJd2+smPr51bhHFpGh1SfDjd6XJ9HBlgR68aXi0=;
        b=O1hhynEcCHbmXd3grZJspejTOFvgwwtndBfIxauy1k/LGta/EVuqXxP9FMTdBYEDy7
         0ADMbzlZvKg/eFc9s1tIE7q2aygJscWQGNIfGdbLFEJuwd8ha50ofGV1Jathba/D6wEo
         qUSDyLyuQOcoAA3EpfG6PKa11UEV5p6EF1P+V5ixmQZvPjTVLqoYv+YSv6SHymQEOvvH
         +afo65ltG8JrrcnRw2Lcr/01PBDXSbDMRskp+kxQkJZ05/JMg8YJgOF/sWNLPJrV+4zs
         kbzPXwYAMQPSQ4l2AsJXWJKuFaVI6yuc6HNwl2mHAG4vyC9gLRUdSHDhNyQjg0NjMtK6
         Cf4g==
X-Gm-Message-State: AOJu0YxwgfFyT7Ax30D6oZOQ4hY0XL0UNvbPki798xOYGpPdDKzNTm0Y
	hnHo0yFKH8tSCwvGQVK46rrA4lJMrxFzO6UAMINJdyQXJU5KIbMb2e99DsNQ1tCbMLfkDyW67/a
	wvaqgsYsBGx5hGzeZPdnxyOsxfpNHtEU=
X-Gm-Gg: ASbGnctiiD5kiIqo5diqeI+pE8Q+DfczqK7QDOO+QeWoeV0EVYl+xTHzu74BVxunu3c
	XB5aT3A+lKXWehEs7wP/XIKGoYOjSyQQYlZAPYPRT/p60ZymrOzkfL0Nz5mHspbVCEMagSgYOik
	tpRj6jp3KxNbpZ1LEJw72n7Fg4smZvicTNwkPQV6T1gM5wjDaYIU/8d23pwo7zTo8KMNkZz/TPN
	Pqu0Mk=
X-Google-Smtp-Source: AGHT+IH7y09RqBJDIO44VPXS9cEHWBswlhWAXjyxJ01cCWVxqy+mV2mBGIjGFNHUAGKIg+wHpxqE2SdwtVomlqOX12Y=
X-Received: by 2002:a05:6808:d49:b0:435:70c4:1085 with SMTP id
 5614622812f47-43597f5ba22mr967287b6e.19.1754622176088; Thu, 07 Aug 2025
 20:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
 <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org> <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
In-Reply-To: <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
From: "David F." <df7729@gmail.com>
Date: Thu, 7 Aug 2025 20:02:44 -0700
X-Gm-Features: Ac12FXzr6_nSWUHRqoOVNzba1mvoKZhN0GesSuYBXoeiJXZEXM2jOVFOwzYQfdo
Message-ID: <CAGRSmLsxTH_sq6Vm0A_v6m0u2USrG981NhBoyJCS1hwY+bENCg@mail.gmail.com>
Subject: Re: Unable to build custom amd64 module.
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay, I changed out objtool to be a script that pauses, now I got my
.o file and ran that command to create the .od file.   There was no
"text.0x23f4" but I did find a line "23f4" and it's calling (callq) in
to a custom asm module (in .o / .lib sense), that does have offsets
within the function that are called/jumped to.  So this is okay, is
there a way to disable that check without the asm source code having
to be changed somehow?   I can't rebuild that .asm file (.s in the
linux world IIFC).

On Thu, Aug 7, 2025 at 7:16=E2=80=AFPM David F. <df7729@gmail.com> wrote:
>
> Thanks, I used the OBJTOOL_VERBOSE=3D1  on the make and got this extra
> bit of information:
>
> mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function ca=
ll
> mydriver.o: error: objtool [builtin-check.c:220]: copy_file: sendfile
> failed: Invalid argument
>
> The .o file still got deleted.
>
> I may have to go into the makefile in the kernel and pause where
> objtool is run  ?
>
> On Wed, Aug 6, 2025 at 10:54=E2=80=AFPM Randy Dunlap <rdunlap@infradead.o=
rg> wrote:
> >
> > Hi,
> >
> > On 8/6/25 9:37 PM, David F. wrote:
> > > Hello,
> > >
> > > The last modules I built was from 6.6.x.  I'm trying to build for
> > > 6.15.x but it's failing for the amd64 version.    I'm building both a
> > > 686 and amd64 version of the module (driver) using the scripts I've
> > > used a long time.   The system is Devuan Chimaera 686 version.   The
> > > 686 module builds fine, but the amd64 get to the point shown below an=
d
> > > fails.   Does it have to do with that warning?  What would cause that
> > > in the amd64 version but not the 686 version (everything is compiled
> > > from the same source).
> > >
> > > Any ideas how to work around this or find the problem.   The error
> > > code doesn't give me a clue of what it is:
> >
> > It does a little bit. Also read tools/objtool/Documentation/objtool.txt
> > in the kernel source tree: search for "unannotated".
> >
> > >
> > >   LD [M]  mydriver.o
> > > mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-functio=
n call
> >
> > (1) prevent "Deleting file 'mydriver.o'" below (I don't know what is do=
ing that.)
> >
> > (2) run
> >     $ objdump -CDlSxp -m i386:x86-64 mydriver.o >mydriver.od
> > (I have never used "-m i386:x86-64"; that's just what I found on the we=
b.)
> >
> > (3) Edit/search mydriver.od:
> >     find the code that is at .text+0x23f4. That should give you a big c=
lue.
> >
> > I can't tell any more without knowing the command line & Makefile that =
you
> > are using to build the driver.
> >
> >
> > > make[5]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/scripts/Makefi=
le.build:408:
> > > mydriver.o] Error 255
> > > make[5]: *** Deleting file 'mydriver.o'
> > > make[4]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:2003:=
 .] Error 2
> > > make[3]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:248:
> > > __sub-make] Error 2
> > > make[3]: Leaving directory
> > > '/media/sf_Source/mydriver/linux/driver/6.15.6-amd64-mine'
> > > make[2]: *** [Makefile:248: __sub-make] Error 2
> > > make[2]: Leaving directory '/usr/src/linux-headers-6.15.6-amd64-mine'
> > > make[1]: *** [Makefile:53: domake] Error 2
> > > make[1]: Leaving directory '/media/sf_Source/mydriver/linux/driver'
> > > make: *** [Makefile:44: all] Error 2
> > > error: Build failed.
> > >
> >
> > --
> > ~Randy
> >

