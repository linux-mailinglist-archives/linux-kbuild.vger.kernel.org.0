Return-Path: <linux-kbuild+bounces-5601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BB9A24D3D
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Feb 2025 10:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E11131884E96
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Feb 2025 09:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5428717580;
	Sun,  2 Feb 2025 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQThwvw1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B9442F;
	Sun,  2 Feb 2025 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738486836; cv=none; b=WbarRHBSFEpIAS3fu+uvM+1e5pMy401nH1WovNva+ejvAzpJjUU5r4+Ub9gyKIELao9dOWabZCFy7YrTh2YdgjcL4sXKzmqQpB/xBYvR/HgHP5NVkFUY+YKY1Mv9rP4IvvcESCGDHciDNZC3W3TbO7mFGAv4bLWRKWROsCOW8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738486836; c=relaxed/simple;
	bh=MpBjjylq1twhBWS4Y9mUkqelCZSN+3Z7Uiu/p1UY8f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhUwYuAfOct6FmTCOq1ke4f4c8JHuThgho28FC9Nu09AbWZXAmb/BKGA7iKldLkRJLYLHlyDx1UYkpZ1f/t8IwMv5IPPBe0pCqLOKeksUCAXbQroKLJRk6x9Il4j0NsXX1KFUoRXAEKByCTdeGML0drRyRWG69ZRfxrh1P6IJTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQThwvw1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaee0b309adso598990166b.3;
        Sun, 02 Feb 2025 01:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738486832; x=1739091632; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXWTm8HHzZWwuEhi+D2fW66OnMGZstu3WmHxOhUtx8c=;
        b=MQThwvw1zP52/hIfuAiGY06tBvRMzS3W34KZCWjl7Ekes6bikWDYXZDyaqWxxpbola
         nSfTysrCC5EHveW0h5xp0qzIZyDJ5nu9hElFpBqypgS9KHOzSO0TsQdmFHnAFW+WFE4T
         cUmWgpHsiaD3Cq5nYMPMnk1TRwzTwWp3gDlAw49Xjy1z2fQuUOrOFM8ERQAw00HyE/8E
         vb2Um5ENVw8str9Hs2hgLAOxiiE9GP5NZxkkTuouUV4rK1w95dpJlK8NVTCohYfHCgVG
         7yEfMysvjwzgHy9m+wZhSUBaVEWjPx7niYdvDaeeM7CZR0dt7VBYB3B3GKVoR5tNllBy
         eFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738486832; x=1739091632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXWTm8HHzZWwuEhi+D2fW66OnMGZstu3WmHxOhUtx8c=;
        b=d0MdrKU1/Qu6dkyoteFi8hnqFexa0L7bKKv2jlhkSdJazb108p810tmEXKkoHzsVlv
         i0qdrE5WZLKdZPLUATUXzzGPe3LhSBEuF4Ck+PQbGvR/Lwc6cS5fdio52yi7LO946/O9
         cSZ8x2rSPAMqpoBwLSc0u93V0OADcJXUeogfYIT5tqPMbV8JgE4vsDpAcvt2d60ItahK
         p1tmQNKue+0e6JT0JXdnkYXOj/GUfl095uFGcNq/9lYK5YeYq9+aseVm/AC+QeosnzhS
         otCr5jLmQEmKLPe9G046XcnauqWFuNzfS8aVp38Sr/JtC3k1KPsjwxljP3GH+m55Y535
         Ju/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbSF1G+UmNlzJkKk43o31wSQzxrG0vYV6qhSBeauubyS8nt+lIB/k669rmvCqv4wpMDKDzCpEM1HWsLGo=@vger.kernel.org, AJvYcCVtt6M5yGcIRt9RPFaaOM+cCcixtJ6wUDWwp7ADdjDvGh6z8hy1M0/CgheM332bPwCfw+fS+6yCvofcxmZI@vger.kernel.org, AJvYcCWylOHjit3T+VcteRUr+9YBBAoSzfvQCnUx4AcZ/lqjBdwrGexmBBtOK6q4aAzgu943U6Kq7s8K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0nOdgzhe+VbgAZG21e47JSKUseNimZg1DhZ79bSYBVZreaZfL
	cWtemz1csxZcDuU/SzO/JISs1Nxm2DCiR81m+mQ6pDYbU0Q8dJsW
X-Gm-Gg: ASbGncvSQZWraCJ89PgXQ6Bi0uIz3gHSrnGBBi01ah1jveh8K3Y/7v5OGgz1/O8RetE
	sX0YUPXLgwo0kAbfk9U04WZL5UyIr3UZxSQcDCi3zDAGx67ABsROEfxvQWyzJxBV454uil5xX+f
	6NefFR2u0vhgKScn3iVYD0qRMR+kTYciFiLcu7L+0+eAGvK8y4I4sz8iIEoHx4SM/n8BL3lZySX
	OfCvmCVEttdJfsBvcfQdZCvXKuB+2a+5sLuFZTmSuQ61tkAx71ruGJ+ZdoGV3xGQGPJ3b/rQ/Ye
	bS0XvjyeE+5nJiLTKodqeDF32YLZ0ccND6+yfpfQnPWJ3VDu
X-Google-Smtp-Source: AGHT+IHPfSEDZtHmIR0Im0QbSh1xu/QDKhIXuIbHW/Bd7eoZ00Axi2+6FYXSIB68wTZDMVavs6lt4A==
X-Received: by 2002:a17:907:94cd:b0:ab2:fefe:7156 with SMTP id a640c23a62f3a-ab6cfdbc4f5mr2091243066b.43.1738486832028;
        Sun, 02 Feb 2025 01:00:32 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf8bfsm543879266b.40.2025.02.02.01.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 01:00:30 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 9AA0DBE2EE7; Sun, 02 Feb 2025 10:00:29 +0100 (CET)
Date: Sun, 2 Feb 2025 10:00:29 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Parth Pancholi <parth105105@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
Message-ID: <Z580LZIi2iXGzSv5@eldamar.lan>
References: <20241114145645.563356-1-parth105105@gmail.com>
 <2024111442-yeast-flail-fcea@gregkh>
 <20241115083940.GA3971@francesco-nb>
 <2024111541-antiquity-footpath-e221@gregkh>
 <ZzcYLAFqTSlFm2uF@gaggiata.pivistrello.it>
 <CAK7LNAS0VzqcKDz_1ds5qJcASqxVizE3kkdRk1Yiidch9KMxEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS0VzqcKDz_1ds5qJcASqxVizE3kkdRk1Yiidch9KMxEQ@mail.gmail.com>

Hi Greg, hi Yamada,

On Sat, Nov 16, 2024 at 04:51:48PM +0900, Masahiro Yamada wrote:
> On Fri, Nov 15, 2024 at 6:45 PM Francesco Dolcini <francesco@dolcini.it> wrote:
> >
> > On Fri, Nov 15, 2024 at 10:22:13AM +0100, Greg KH wrote:
> > > On Fri, Nov 15, 2024 at 09:39:40AM +0100, Francesco Dolcini wrote:
> > > > On Thu, Nov 14, 2024 at 05:02:01PM +0100, Greg KH wrote:
> > > > > On Thu, Nov 14, 2024 at 03:56:44PM +0100, Parth Pancholi wrote:
> > > > > > From: Parth Pancholi <parth.pancholi@toradex.com>
> > > > > >
> > > > > > Replace lz4c with lz4 for kernel image compression.
> > > > > > Although lz4 and lz4c are functionally similar, lz4c has been deprecated
> > > > > > upstream since 2018. Since as early as Ubuntu 16.04 and Fedora 25, lz4
> > > > > > and lz4c have been packaged together, making it safe to update the
> > > > > > requirement from lz4c to lz4.
> > > > > >
> > > > > > Consequently, some distributions and build systems, such as OpenEmbedded,
> > > > > > have fully transitioned to using lz4. OpenEmbedded core adopted this
> > > > > > change in commit fe167e082cbd ("bitbake.conf: require lz4 instead of
> > > > > > lz4c"), causing compatibility issues when building the mainline kernel
> > > > > > in the latest OpenEmbedded environment, as seen in the errors below.
> > > > > >
> > > > > > This change also updates the LZ4 compression commands to make it backward
> > > > > > compatible by replacing stdin and stdout with the '-' option, due to some
> > > > > > unclear reason, the stdout keyword does not work for lz4 and '-' works for
> > > > > > both. In addition, this modifies the legacy '-c1' with '-9' which is also
> > > > > > compatible with both. This fixes the mainline kernel build failures with
> > > > > > the latest master OpenEmbedded builds associated with the mentioned
> > > > > > compatibility issues.
> > > > > >
> > > > > > LZ4     arch/arm/boot/compressed/piggy_data
> > > > > > /bin/sh: 1: lz4c: not found
> > > > > > ...
> > > > > > ...
> > > > > > ERROR: oe_runmake failed
> > > > > >
> > > > > > Cc: stable@vger.kernel.org
> > > > >
> > > > > What bug does this resolve that it needs to be backported to stable
> > > > > kernels?
> > > >
> > > > This is not solving any existing actual bug, and therefore there is no
> > > > fixes tag.
> > > >
> > > > The issue here is that the kernel build system is using lz4c, that is
> > > > deprecated since 2018, and now distributions are actively moving away from it.
> > > >
> > > > openSUSE Tumbleweed and OE already removed it, so you would not be able
> > > > to compile a stable kernel on such distribution when using lz4 unless we
> > > > backport such a patch.
> > > >
> > > > Everything should be properly documented in the commit message already.
> > > >
> > > > My understanding is that something like that would be a reason for
> > > > backporting to stable, if my understanding is not correct we'll remove
> > > > the cc:stable and send a v3.
> > >
> > > Please read:
> > >     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > > for what meets stable kernel requirements.  I don't think that this
> > > patch is that.
> >
> > Greg, ack.
> >
> > Masahiro, can you please let me know if we should send a v3 with the stable
> > tag removed or you can remove it yourself when applying?
> >
> 
> I applied this with the stable tag removed.
> Thanks.
> 
> (I guess someone may want to backport this eventually,
> as such distros cannot build stable kernels with ld4 compression.)

Yes please :)

Greg, are you willing to reconsider this and pick e397a603e49c
("kbuild: switch from lz4c to lz4 for compression") for inclusion to
at least the more recent stable series (in particular 6.12.y).

For instance Debian trixie will ship with at least lz4/1.10.0 which
does not include anymore lz4c.

In consequence our build fails now with the updated lz4 which "just"
entered Debian unstable (for the kernel aimed to be used for the
upcoming Debian trixie).

Regards:
https://salsa.debian.org/carnil/linux/-/jobs/7022458/raw

Regards,
Salvatore

