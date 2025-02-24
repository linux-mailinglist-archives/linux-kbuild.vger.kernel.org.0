Return-Path: <linux-kbuild+bounces-5892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98548A42FEA
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 23:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D4E6173537
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 22:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8438D1C8623;
	Mon, 24 Feb 2025 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IKIVZJtb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE42B1FCD07
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740435474; cv=none; b=hoaANYp//9uTVNmj/huT5UHlIQsHLMFquU4Y+KX0IVb6aNXrWQkp19FTJDO5Kh5hCt+oBkQ/2DtysoumHrvTKOq7JdQe7xdxobB/crRKuAPmka//mIw7DLHPFYvM9iD29Z2IMDqweK6Ea6vnPfn9LIq1UFq+aCID3hHfUxURvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740435474; c=relaxed/simple;
	bh=mgQvBZwk3THrKuCVDo0w3jzsMV0eG9pui3bcYj+AoLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LK3ea48/C8SFXhKpReFwe9lAeh8z+KbrzHZECTSPOQR6mDjjB7nKypscecHXdzit+tNRocazw/eoQuYmS1OJVjtlpuMheW+yt+XFA8jLkep1s2n77G4w5WGLkwzAfkv+HlbnKA0RmNYAPkNH0HX24mMMXlhCoGWoKg96SToG5Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IKIVZJtb; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-6e67f377236so39565806d6.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1740435471; x=1741040271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC+IaWPjUIgPtZWawpIdN8hkGIWmRuDYGToBbJQnJIk=;
        b=IKIVZJtb5OQDNTUV3MoZvDbfd3gUeX4fRMT3lnqy56z9JBJk7Jt3vji/+UraM47tev
         Z1HNdrGyIjAd8DM5olBdB3/QqyVJm4MxAHZJrknqQuiCmArhazQL9S/do/TVpqF5fjHQ
         MS3BbSqOv+bDmRYik5obFWm2ZHDPlYem32FUO0iN6IWej8543sn4gkYWiG8oJ0xvTn04
         bEeLxf01Bquq2ZWJW/Mo3yG/JOTVFxPEsGM32z4xjhMN3OM3ysQVi6H3hRNGxVSPhO/B
         Xhcwn/1kpGLU8W0cz3dbyhJdsokwOm0nxWHebPAzkngNpKvwW0YF4/1FnL7s1gduez86
         TsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740435471; x=1741040271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC+IaWPjUIgPtZWawpIdN8hkGIWmRuDYGToBbJQnJIk=;
        b=tbhoa9OnRJkA7yV3ImYOjxrIe942n+JlzYAccXZu+2WSqQL2fKrS+TUrp4xu9i0yEz
         +IcePOnubmx0xkr7nZRAoWhqWB7/KKB5Z5lm1R4kbQ9Vm+oVixKK1lLVy2oBA/Zmcck5
         BgtR+U3HIspGJ3G1nRoZk15vOc/eP5N6hwqF3pSZsimp6KmukNM7yQUS+DFETG2WASIz
         HZcACGEQtJaQfLZxBWaCvOvSDTTng3pp3LvPaISd8dPlOonKKMZ8pqaJOIpu0vVsYHIU
         ekSmeSVIpiuQkKIWToUp6mzd1QJ6gEa29lXWtYnAKJSsRdVZx2/Sy2CHy2kzNWsHudf+
         1stQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqL/GEgijblzyrU95cwUQSr/QnLtQqsLmNwd10YVccLpUJSyrsYkbXxvb3D+1SrDIOFS/n772QD+QKJAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYBP1S7NpEUfJFfLrJVr1R/5FBnp4P8S/mjac+PQVpg3sfzil
	x517KE9K3ZRPap+vbZ3mr1k2HmvxsO9PR959NTwyiGExd9hemWlv/FBeAHRMbWry6lok9NIOSIG
	6JMPIVkIwkbj2YvktAMSyFMzhkKpjhVU1pimRCA7YV3o7zuS3
X-Gm-Gg: ASbGncsYFCm4gtX3S5U5fSwWpEiIVu9ypMQlUcvCij0nQZdQIsqwHWmW9g0UNOZqFme
	BFFIircTQn7BXVSsVnapuybAaM5mNg4/az/GT3kXmm5XdbtTkSkiaUnGpGKhbvqaUcusbjBgNZ9
	jz7E1Bvny8/9K1Q5x7Ilk4onZ0qnvaeWFZMb3fM04cYRHNgp1AeIpR1hQBfnPFhSge7NmtCkTHL
	NOv3qcpSIrvDcCsVCwuo/l6zNO4e+G+F3GQ0de+r5zLf3p5e8SBmfu3xI5JFaV98hYTnEkkVS9u
	heP1TvW2dmsOCpWroq+mKYGzN7+UknPbAKk=
X-Google-Smtp-Source: AGHT+IH/PTraR4MXHotGLdhg6QZFXd/3L47ZJu2IJS2hAu0r7/MxlKi7zBdktTFdGo3uK3uBFmrOJQ5Fk6MP
X-Received: by 2002:a05:6214:d0d:b0:6e6:65df:557a with SMTP id 6a1803df08f44-6e6b01a9d9dmr183514456d6.31.1740435471504;
        Mon, 24 Feb 2025 14:17:51 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6e87b019368sm188916d6.7.2025.02.24.14.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 14:17:51 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 6483D3403B9;
	Mon, 24 Feb 2025 15:17:50 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 0A246E55EF5; Mon, 24 Feb 2025 15:17:49 -0700 (MST)
Date: Mon, 24 Feb 2025 15:17:49 -0700
From: Uday Shankar <ushankar@purestorage.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: improve debuggability
Message-ID: <Z7zwDV5BvezaS6Sn@dev-ushankar.dev.purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
 <Z7Pv+hD3AOS/ymFI@dev-ushankar.dev.purestorage.com>
 <Z7zJ5EjIFLbz9C3I@dev-ushankar.dev.purestorage.com>
 <20250224170709.3eb9d94c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224170709.3eb9d94c@gandalf.local.home>

On Mon, Feb 24, 2025 at 05:07:09PM -0500, Steven Rostedt wrote:
> On Mon, 24 Feb 2025 12:35:00 -0700
> Uday Shankar <ushankar@purestorage.com> wrote:
> 
> > On Mon, Feb 17, 2025 at 07:27:06PM -0700, Uday Shankar wrote:
> > > ping  
> > 
> > ping again
> 
> Do you just package it, or do you actually use it?

Are you talking about the two scripts whose shebangs I modified in patch
1? Those scripts aren't used by the build process, they're just packaged
in kernel-devel by the following command

%{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'

Presumably those scripts are important to users of kernel-devel, which
is supposed to "provide kernel headers and makefiles sufficient to build
modules against the ... kernel." Though looking closer at these scripts,
they look like they're probably extraneous for that purpose.


