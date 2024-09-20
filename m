Return-Path: <linux-kbuild+bounces-3653-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C293C97D35E
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 11:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E58461C213C8
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 09:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8A1135A69;
	Fri, 20 Sep 2024 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcAStUtZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829091311B6;
	Fri, 20 Sep 2024 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726823247; cv=none; b=hf41eIG2UTGmMZROZI4YebgBNoO12BYb3R66U8gk0nMLjzApc7eQroZCsSObXA+/H2GpYoYwDLaXHPpd/BoQYAH4U7en+Upaeu5R6uQyxxJkJrhfwUbXkn9TDQQxTJSWIOYJyD/zXgVQtqGx+QUAEH0aZwM6rm4+LH6ENO8AN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726823247; c=relaxed/simple;
	bh=1W/vNg24ijyt+ohmdhboKpOvG4M/E1Kjs0Nio0YiFuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WiiRgCt7niJv/e+P6I84SIDX3SR793K11XkSey1WNvcaFd2aZtae2CPhK823b2FGnxMeZtpt+2JMVjKiGR5xO7RIRHflLdPTYwf8TC/wPcByapVtZEXJLu9F0KCr4XVy6Xjlaz0kMtZQa1s7mHhwNiXY0xaD/0jdkPSFPz2gaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcAStUtZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso312393866b.0;
        Fri, 20 Sep 2024 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726823244; x=1727428044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qw+m0q1r4IxYHWGNLkcr5AmxGd10neIFyiXitrVL5Fc=;
        b=RcAStUtZGp0G0pv4ltWZYTF1ktCqbLWmkOB74oQyRE8ZNGqh8xy1mG7WFstCm6q/vw
         siB0yjoJx1qho7emIf8yYnx4fuUDWcdiZHGQIt5uqg2sGU1twL3N7oTCnhJTUeH+CI/U
         kib7lmPGqVvvuqAlfned6Ug1Wb7PEmhMxUogsSvYxVj0hev+fR898RynpUwY7YkyP0TT
         4vM7wsc6qjrZ/V3/0n76Pu2bhmXQR3X/nRQBqfBgFkQXJYbxgYrHE8NG3suKLlTgIEJS
         eRxNjDe22V/V+9o2VCpWRR6xbUlVLJnpixPzs/P6VJu0GwJTVZdvSLQzq/FG+nrMbwC3
         fypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726823244; x=1727428044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw+m0q1r4IxYHWGNLkcr5AmxGd10neIFyiXitrVL5Fc=;
        b=IKSswtoSx7OQlUdskNwdvdjkaJRyALTPSILj/TzZozOFyoGq5Td0hM/nVhdXGkesiM
         3pnBkLfe+Y3PS341GE0ZnZ+dix3BxHn1XjaYQRvcxebFR9zFTvMyXL38eBjddRn8/AtN
         I6MN/WR/QboqmbD4mp+cXW3szb6Yje4XqGiSN+a07onIZb6nYWkhN2kP+ACC6y5QolFw
         61BSuXoZbq6TomjYVX4riwndY0IOpgVp5Ajymva4QSTb9rkzz6yw/TjX8BQr8Yu67wcT
         VnKEQ82YR3bunhgGZB0ynOPDadUoqihL7bi8CuC4oTRNmAL5OMl2g3JGbGeX/1+3a++X
         MwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfFa+DUNaOoXRLKohWPIfJVoNh4UG3PzfMAgw3q/oQGAat8hIwyowfL99iUpSX1dOzKVA280jHvwO2qTU=@vger.kernel.org, AJvYcCXBrZwtnRxG35NFH2OK56BNWzCpos46eBh701jT0phZoAJe1V0Z6N9cf/n6YhBq4bC/UmOYyWIuPk5JNdBd@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSja+Gzni8g83cSWYJxlEFk1Xj60TfZinAlNTHagtvtng4Ie9
	kHEURyMxt/Kvkh4rjEMjwhFdtcTNqlKfFPl1f64kYpbP549W5qOR
X-Google-Smtp-Source: AGHT+IGURv5RK6sAdlYpRfsfsm5WwxturaKTgVMCFOMqyn+9eXO0aSm8vLfDdA+3aK8GBMM91F8Tcg==
X-Received: by 2002:a17:907:980b:b0:a8d:29b7:ece3 with SMTP id a640c23a62f3a-a90d3645713mr245422066b.33.1726823243633;
        Fri, 20 Sep 2024 02:07:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:422c:48db:9094:2fa9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90c39cbceesm203669766b.132.2024.09.20.02.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 02:07:22 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: mcgrof@kernel.org
Cc: deltaone@debian.org,
	jan.sollmann@rub.de,
	jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	ole0811sch@gmail.com,
	thorsten.berger@rub.de
Subject: Re: [PATCH v4 02/12] kconfig: Add picosat.c (1/3)
Date: Fri, 20 Sep 2024 11:07:12 +0200
Message-Id: <20240920090712.52825-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZtlyCR4EloWbeWG7@bombadil.infradead.org>
References: <ZtlyCR4EloWbeWG7@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/5/24 10:55, Luis Chamberlain wrote:
> On Thu, Aug 29, 2024 at 11:23:52PM +0200, Ole Schuerks wrote:
>> If one has to install some external package first,
>> then that might diminish the usefulness. While there are extreme cases
>> where it can take hours to manually identify all the dependencies, first
>> having to build PicoSAT might take longer than manually resolving the
>> conflict. Many users might then never install PicoSAT to try out the
>> conflict resolver, even if they would benefit from it.
>
> That's a package dependency problem, ie, a distro thing to consider
> which packages users should have installed. But isn't the bigger issue
> the fact that you want some C library not the picosat binary tool? Or
> would it suffice to just have picosat as a binary installed? I see at
> least debian has python3 bindings now too python3-pycosat. So what type
> of picosat integration really is best for the task at hand?
>
>> So the question is whether using PicoSAT as an external library is worth
>> the portability issues and effort, and whether it wouldn't make more sense
>> to directly include the PicoSAT source file.
>
> The pros of an external library are less burden on maintenance, and
> otherwise we'd be forking PicoSAT, but as I mentioned, I don't see a c
> library but instead just the picosat binary. An alternative is to use PicoSAT as
> a git subtree inside Linux on a dedicated directory, this way PicoSAT
> can evolve and we can update it when we need to. Note a git subtree is
> not the same thing as a git submodule, those are terrible.
>
>> Otherwise, if we go with not including the PicoSAT source, then one could
>> inform users about the missing package in the GUI, like this:
>> When PicoSAT is installed:
>> https://drive.google.com/file/d/1asBfLp1qfOq94a69ZLz2bf3VsUv4IYwL/view?usp=sharing
>> When PicoSAT is not installed:
>> https://drive.google.com/file/d/1ytUppyFPtH_G8Gr22X0JAf5wIne-FiJD/view?usp=sharing
>>
>> Let us know what you think. Include PicoSAT directly as a source or not,
>> and then inform the user via the GUI?
>
> Do you need the picosat binary or the actual c code for helpers /
> library?  I don't think we have anything in Linux yet using git
> subtrees, but I don't see why we wouldn't for generic tooling and
> this might be a good example use case.
>
>   Luis

The packages mentioned in
https://lore.kernel.org/all/20240710065255.10338-1-ole0811sch@gmail.com/T/#m34fdf309ecd545d72d898655d8c1a2653d1cdb81
include the necessary libraries. The Python bindings aren't useful for our
purposes, unfortunately, since many important features are missing, in
particular the tracing of which assumptions failed. Using PicoSAT as a
library seems to be the best solution.

