Return-Path: <linux-kbuild+bounces-6150-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA4A6238B
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 02:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B94719C6EBF
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 01:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6174B67F;
	Sat, 15 Mar 2025 01:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HvVsw8wK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB272F2F
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742000416; cv=none; b=nOH3Xsa8dmMXlVJgBCOpTI39670iBUP1L27ETGO3JZOuQqmnShKQn+5wUTgpa22oME9U2k4bwJINHhUM3yN2FT353aqr7D69KlGvxX6nPulGEwOI3vik2nt9vULq82rVD7hxyTvlRddKCjouR3nB+u2kQ0iSxWSOE/KpV/nP0dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742000416; c=relaxed/simple;
	bh=UT/EYsTa1amOk6NZBx+c1+6vvGQiM6MSvPTUS00Ww30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duTXfPqdQTmMrMD28k4YuldLFmLkaSfkaNvq4FF6/J8A/BhKl5rI33DvI5e3EVjypiVKJkA4j/BV6Q0YX8W/m4+jkDc76uI4XnoOUb2lUDDZ8X6gM6SIxsdNaY9vagwpN3hJLsqA7D0smIzhV10HU/Lwn3Q991LNbCKOMt3UbKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HvVsw8wK; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-224019ad9edso67853435ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Mar 2025 18:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1742000414; x=1742605214; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uOMjItR1goBV0o4ylCjo9wmyBauT42lJmyQjqZQYP3M=;
        b=HvVsw8wKI6y7UWuLOzXGrsFdNAI9HrrPriOJ3ja5Wr7zIk+iOWZ4k2oQmyVBTLETp8
         R8BZyx3anfmDXmZVQNrfzvCWv6uvKLAF3DX+1ugpv6Q348tNQsCt8Mkil369tpuiLn2C
         YiuCTQvI9EQDz8j1dhmFpfK2iIZ4FcR7rsGNiXLLwiU4POtMF6EUTxDez56LIw4gAG4G
         8L4B0mitZyO1hRMkV7zLrE/ww3KfzpQAZBMNzF+82Q0eALJuF8cAJUkmFqPdHTUVA2vL
         ypuRS95S3xXYnSn2xV44TVd2lKqmb+RwJd+JpX6uLrnGj+pwuHSnR6OxfI1zVu+rPEsF
         P31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742000414; x=1742605214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOMjItR1goBV0o4ylCjo9wmyBauT42lJmyQjqZQYP3M=;
        b=lOiv4t2qqt2lzeN7Mui4VvFBbXj/mHEzAuZNWrf1hy0fi1Ix2Mnnj4M0CT1OUuF1GU
         YyDas1MwmwqciDxYk8S0IRpz8vjX146+mExzgXJCTr3LzlZTlD8wXBpyftDTXaQBn080
         nyFWS6lLrFu6JRz1MFLTQw7mS8fjlwUTUBy+y3uH2bQU2jMVN3JJLRLsdooyimuQavBy
         m4TMFTaF6JpL681XDZAG40oo8ohiQWa7Otx8SP5hBg3yk67Nw5IAleSM9sYZWtD+IliO
         /NzR0KyF5PbsHFy4WkJrKnkK8u3qwiRVgIql/nZabBg/f5VCoEztll/JGJOuxyQBveX2
         BmvA==
X-Forwarded-Encrypted: i=1; AJvYcCWsWjnq2AgM9CVRCYqMOuThpzRknuKUx4NNPNSix13JunXvVXgrwsbFBPxP4WCqxppM5okHQ5GJzu5iPos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4YM0buCUCNPzml9ndST+WHwcyU3WKkgCH1DHMmUv57o+qcuzs
	274uudVVV6cZZPt97vh1KuxesmCLQ7kAU30ylUKptJLwFE6RYSNr29IW0EnZFQ97pSMaHJNTY2d
	LE2m4OmVWx8I+j3JlL4QdSEMqKXPQsQkn68c4DRxqmH0Srx6u
X-Gm-Gg: ASbGncvMqPf1r1eZ/CwmHj+80jlE9Sxp/VRqxCA6p2gEEoWGRI0mWCt3Q2XuJhcq1RE
	0uDCmGkX3YF/GbT4QKD3+h3KTxWZGXM9M+o8djX5vFMmYVopy2duNyGNmSFQ3m5tqjuDjRQTVQI
	kqaJFPUgGkyQB3VfBJBxb0VfT3CgO09flRodkGX0EHWHRNY6FERRf03UttjwRqZCy1gpl3VG1Xa
	ZQO9W+RThz+LRkjSoPXohiXksVtE6dT5PRgK3aCQHKed1Zj9u4vJaL6tX9qj6T1/yMJODyPv2NC
	CeQZVonWve93BBhPWN6FjwSrkMLiIgM7jrQ=
X-Google-Smtp-Source: AGHT+IFb1A0ZnC9OiXaxMAvCNlG4iNHcUTDySK3FTx1OU9pxiTuot2YHOpf6EZcqMTgFPVqmhVHneOK+j511
X-Received: by 2002:a17:902:e750:b0:223:90ec:80f0 with SMTP id d9443c01a7336-225e0a6b3f8mr62407775ad.22.1742000414166;
        Fri, 14 Mar 2025 18:00:14 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-225c6b5e136sm1974935ad.34.2025.03.14.18.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 18:00:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 43D5E340314;
	Fri, 14 Mar 2025 19:00:13 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 3ADF6E40231; Fri, 14 Mar 2025 19:00:13 -0600 (MDT)
Date: Fri, 14 Mar 2025 19:00:12 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: rpm-pkg: build debuginfo and debugsource RPMs
Message-ID: <Z9TRHKj8l47gb2Mx@dev-ushankar.dev.purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
 <20250210-debuginfo-v1-2-368feb58292a@purestorage.com>
 <CAK7LNAQz-BKmWNuw+CWfPHWVmN6x3cpj941_iAp_5xdq+eS1DQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQz-BKmWNuw+CWfPHWVmN6x3cpj941_iAp_5xdq+eS1DQ@mail.gmail.com>

On Sat, Mar 15, 2025 at 04:56:35AM +0900, Masahiro Yamada wrote:
> Sorry for the long delay.

No worries and thanks for the review!

> On Tue, Feb 11, 2025 at 10:12 AM Uday Shankar <ushankar@purestorage.com> wrote:
> > Note that this feature is incompatible with CONFIG_MODULE_COMPRESS -
> > if it is turned on, the module .ko files are compressed before
> > find-debuginfo.sh sees them, and it will not be able to extract
> > debuginfo from them. There are two potential paths forward here:
> > - teach find-debuginfo.sh to extract debuginfo from compressed kernel
> >   modules
> > - teach the kernel build process to produce split debuginfo and then
> >   package that directly, bypassing find-debuginfo.sh
> 
> 
> 'make bindeb-pkg'  (Debian package) is able to build the debug package with
> CONFIG_MODULE_COMPRESS enabled.
> (see scripts/package/builddeb if you are interested)
> I have not checked if this works for 'make binrpm-pkg' or not.
> If this is a tricky case, I am OK with giving up CONFIG_MODULE_COMPRESS.

scripts/package/builddeb is able to do this because it is more hands-on
with the debuginfo generation - it invokes objcopy --only-keep-debug
directly. Meanwhile for rpm-pkg we are relying on find-debuginfo.sh for
the debuginfo generation - we just set things up appropriately (meaning
that we mark everything to be stripped as executable), and
find-debuginfo.sh does the rest. This means we can get debuginfo without
working as hard, but our flexibility is limited - without nasty hacks,
we cannot really handle compressed modules unless/until
find-debuginfo.sh is patched to handle them.

I could try revising this to remove the dependency on find-debuginfo.sh
and strip the debuginfo ourselves. Then we could handle compressed
modules the same way that deb-pkg does.

> > +# make modules executable so that find-debuginfo.sh strips them
> > +find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type f \
> > +       | xargs --no-run-if-empty chmod u+x
> 
> This seems necessary and correct.
> 
> One side-effect I noticed is that *.ko under /lib/modules/$(uname -r)/
> now have +x permissions. (Previously, they were non-executables).
> 
> I checked Fedora. Modules under /lib/modules/$(uname -r)/
> do not have +x permissions.
> 
> Do you know how Fedora's kernel.spec handles this?

I'm looking at

https://koji.fedoraproject.org/koji/buildinfo?buildID=2661097

The spec file for that package actually does something similar to what
we're doing above; it has this excerpt

# mark modules executable so that strip-to-file can strip them
xargs --no-run-if-empty chmod u+x < modnames

But later on it compresses the modules, using some RPM macro magic to
ensure that happens _after_ find-debuginfo.sh has seen and stripped the
executable modules. The compression eats the executable bit.

> > +
> > +%if %{with_debuginfo}
> > +mkdir -p %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
> > +cp vmlinux %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
> > +%endif
> > +
> >  %clean
> >  rm -rf %{buildroot}
> > +rm -f debugfiles.list debuglinks.list debugsourcefiles.list debugsources.list \
> > +       elfbins.list
> >
> >  %post
> >  if [ -x /usr/bin/kernel-install ]; then
> > diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> > index 4dc1466dfc815c110eb7206f83dd874b17f5170f..4c96bdca381a2fb4cc57415ca914d14e37e16caa 100755
> > --- a/scripts/package/mkspec
> > +++ b/scripts/package/mkspec
> > @@ -23,6 +23,9 @@ else
> >  echo '%define with_devel 0'
> >  fi
> >
> > +WITH_DEBUGINFO=$(grep -c CONFIG_DEBUG_INFO=y include/config/auto.conf)
> > +echo "%define with_debuginfo ${WITH_DEBUGINFO}"
> > +
> 
> How about this code?
> 
> if grep -q CONFIG_DEBUG_INFO=y include/config/auto.conf; then
> echo '%define with_debuginfo %{?_without_debuginfo: 0}
> %{?!_without_debuginfo: 1}'
> else
> echo '%define with_debuginfo 0'
> fi
> 
> This allows users to skip the debuginfo package
> and aligns with the existing code a few lines above.
> 
> Also, it is compatible with Fedora's kernel.spec.
> https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_236
> 
> 
> If you do not support CONFIG_MODULE_COMPRESS,
> you can check it here.

Yes, both suggestions make sense, thanks. Will implement these in v2.


