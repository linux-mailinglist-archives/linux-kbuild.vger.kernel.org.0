Return-Path: <linux-kbuild+bounces-8318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E109DB1E085
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 04:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17E83B4898
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 02:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2477FD;
	Fri,  8 Aug 2025 02:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVEZ8Q9D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CE2645
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2025 02:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754619434; cv=none; b=QUw0N8Fyhb2ot0J38fa+kJv/CwcTTRVYV+foa0UNl6YHjBVuYURnmQvjoN78u4OAb5VWyRV5QRyQpXQzcnfS1mTv2+PATr5CIVZ4fB6n/xIw4woZLeraZ+rLv41nE96MfRDv6qJ8Dy8aUiemBkaSMR9v/4anCrBUQpsovHuYB2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754619434; c=relaxed/simple;
	bh=47UQbWDjh+fqLLsOUx9NSaNSM6y7Dxi8rDp0yIQeplo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhusCB5N3/ylpXCb3Vhy97z6ed3gNxwL8Ygo8mEk8jpZ+8sMe/hqZ/hA/ZQedykW6f0LV7GcYcRcor41Of4hTHXG4PFg5ks8JxKIpJ4/8LgWHlETimCrj++cuL/WEkaHAug8SVMrU3YNfn96HAY8Sr69i0SbVGd4I65KCGnMirw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVEZ8Q9D; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-43590a0e89aso317561b6e.1
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Aug 2025 19:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754619429; x=1755224229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEP+tOTCrr+lH26ut4Wi48cTYWxBHI6dcQpI29zEI2A=;
        b=lVEZ8Q9D2WAlPjglejtkhJI587np4kM6tKvbGCqohCZLWRhcwxipenCbkTdYGKE/hQ
         k92O3Kqw5OjeShSNjT0Dynd+TkUDEP3oc5WaakUmSuQaC4wVCl82RVt7AgOxcXKN+n9H
         TNjXCnat6N8UWSGcxJ2hEciL4rtAVeyIX+jRSyiuFFLWFCwHIl8XbOdVjgR0RE05f1sc
         SEb7dOSCFmerYtm+Y21R1X6+nYsiSkkaXehbXp8pUWsvedIT91epwnbdAvLvPqy8RiFK
         y7fKmwt0PYIkIuDAkuY6A5r+RW/I/lHdn9ayDc2GlO+VcmmA9SkrdiQIJJ30hKF5PZQ6
         Z5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754619429; x=1755224229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEP+tOTCrr+lH26ut4Wi48cTYWxBHI6dcQpI29zEI2A=;
        b=OmtCuFAUh6/sHYtCnsSGbay4UQV1ZiEQ6CI+XEARgJfpzZNH9jGrWtmB/APJx+jo/1
         niwe62KRlqohlGnN1195921lS1BYkxYQwAwBYN+Wptlf+XTL8w/vppKJlnbvXIpADwwi
         wQDq6kgTcD0s3p7p5OXQxBTlTPVvHBR1TWEkqHKrCBjxip7ri098g6QgFQNz/Ll769rz
         JZ4PmMerLZFVOQUUn/Bw1cZA7v7A/+txz7qTze3ka14wnEK4DocFsR4GVPmWh08rnU9S
         p2L+FYkIJbHaWQ+5TnX6MAjSbz8nCos1pT9ow7eBYo5/5z6awYjQMD7r5XYECgvLLaMV
         h1ew==
X-Gm-Message-State: AOJu0YwAv0ojSWi/g+HzCCpDxoLk3eXHxUgv0+kdAc1nBIUvoELiXlDY
	6taG9Ucr3/zGgNlKw5FzajyUztrpfMLpw+YmTo3SHMsUscGM8fgprY0VAbb4OyVwEM3CwzXCNv3
	4/Fq0ftAGaTqHvGXhYTpeSntqD1kKiP8=
X-Gm-Gg: ASbGnct2YuaNBVQyUCmvYfUCJ9qlV42HjZdhJYoenUttC+igMMhQYXYlSf2oX0SBFTL
	WAPSITqqrD4qvZ+LztKu8QUeIZvYW8njo73yNQjjXOVZxKkz9la46eD3LEQdYEd+bsbegDiq+ow
	2nKr/xXMTtxpc0wbzAypyCWM7U1L6zEYWRenadlKR6u4FS0525BaXGEnqU4Qts95mcoH9bvUaFq
	Z9ud7w=
X-Google-Smtp-Source: AGHT+IHZZbm7Z88Jw3iyJhuvQg00Cj4ycKmb6CpXEFMIW/nQB2Rymv/K0u6R+AslW2vS+C7BvnppQydKtL4qwNRE9Ps=
X-Received: by 2002:a05:6808:13c5:b0:434:e9a5:b7f3 with SMTP id
 5614622812f47-43597b9e302mr720747b6e.11.1754619429065; Thu, 07 Aug 2025
 19:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
 <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org>
In-Reply-To: <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org>
From: "David F." <df7729@gmail.com>
Date: Thu, 7 Aug 2025 19:16:56 -0700
X-Gm-Features: Ac12FXxZ08bfAoC27QFc3uWwJl2TNxuIpkM-gjyAb9ZJ-ChLd-CsQK-I0mlMLrE
Message-ID: <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
Subject: Re: Unable to build custom amd64 module.
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I used the OBJTOOL_VERBOSE=3D1  on the make and got this extra
bit of information:

mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function call
mydriver.o: error: objtool [builtin-check.c:220]: copy_file: sendfile
failed: Invalid argument

The .o file still got deleted.

I may have to go into the makefile in the kernel and pause where
objtool is run  ?

On Wed, Aug 6, 2025 at 10:54=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> On 8/6/25 9:37 PM, David F. wrote:
> > Hello,
> >
> > The last modules I built was from 6.6.x.  I'm trying to build for
> > 6.15.x but it's failing for the amd64 version.    I'm building both a
> > 686 and amd64 version of the module (driver) using the scripts I've
> > used a long time.   The system is Devuan Chimaera 686 version.   The
> > 686 module builds fine, but the amd64 get to the point shown below and
> > fails.   Does it have to do with that warning?  What would cause that
> > in the amd64 version but not the 686 version (everything is compiled
> > from the same source).
> >
> > Any ideas how to work around this or find the problem.   The error
> > code doesn't give me a clue of what it is:
>
> It does a little bit. Also read tools/objtool/Documentation/objtool.txt
> in the kernel source tree: search for "unannotated".
>
> >
> >   LD [M]  mydriver.o
> > mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function =
call
>
> (1) prevent "Deleting file 'mydriver.o'" below (I don't know what is doin=
g that.)
>
> (2) run
>     $ objdump -CDlSxp -m i386:x86-64 mydriver.o >mydriver.od
> (I have never used "-m i386:x86-64"; that's just what I found on the web.=
)
>
> (3) Edit/search mydriver.od:
>     find the code that is at .text+0x23f4. That should give you a big clu=
e.
>
> I can't tell any more without knowing the command line & Makefile that yo=
u
> are using to build the driver.
>
>
> > make[5]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/scripts/Makefile=
.build:408:
> > mydriver.o] Error 255
> > make[5]: *** Deleting file 'mydriver.o'
> > make[4]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:2003: .=
] Error 2
> > make[3]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:248:
> > __sub-make] Error 2
> > make[3]: Leaving directory
> > '/media/sf_Source/mydriver/linux/driver/6.15.6-amd64-mine'
> > make[2]: *** [Makefile:248: __sub-make] Error 2
> > make[2]: Leaving directory '/usr/src/linux-headers-6.15.6-amd64-mine'
> > make[1]: *** [Makefile:53: domake] Error 2
> > make[1]: Leaving directory '/media/sf_Source/mydriver/linux/driver'
> > make: *** [Makefile:44: all] Error 2
> > error: Build failed.
> >
>
> --
> ~Randy
>

