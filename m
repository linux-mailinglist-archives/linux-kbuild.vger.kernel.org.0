Return-Path: <linux-kbuild+bounces-4455-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069159B83E7
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 21:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3E82822BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 20:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35FF1CB33B;
	Thu, 31 Oct 2024 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qmx5JRG/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932371A3BC3
	for <linux-kbuild@vger.kernel.org>; Thu, 31 Oct 2024 20:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404844; cv=none; b=l8yymcYs6NyUCAAM4pxXUo505BTeJohtVZEDtoM3uxnFC6tLDa8u1zxmQ4v5ou9/CZ4WnNFmmuBO2+YWifcWkR1H3zdpLondiDwJ8YDqyWyo9sOU9oSC0+t9iAguuzDmyCzTNiJ4RZ8pSc2pO/SVfqV5yI3yRNwLph9S4ytek0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404844; c=relaxed/simple;
	bh=iDAzPgn9vQQIclwk4KVakaDzMOUp56nE/SfuLH3hk08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8To0/gG5y1hkkPF+aSGn39X0+uJtNSxpuuJ+CXtK3NiCq6qQRj5JyXGCuMID7ed5Za//M/q/S7ODQgxnx9Lwxi+hCay7e+oMDFljKnYFZOPHoFFhT2rOT7dVLQpVRXPnDtZLcolSWVgDR6j8IgspRkQxMvFTNnr8KHzLUYN4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qmx5JRG/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e681ba70so1174e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 31 Oct 2024 13:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730404841; x=1731009641; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jkl3TjMzcf3dryOCaAILRFpWIEyfiit3GjcJM3g5SKw=;
        b=Qmx5JRG/WvY08/igfKnIIa69WHbuc/1HW5WvS5i20r3Ai+ppafazCqQLnE8dxX3FV/
         I1QY/ye7Og5rWWfPTtdXqbccGBxEQvnAIAtzkeScYnWZVCNygPnvCJOWOUpUssjqO+5K
         J8IlybxA+IqOYd5c37tHWU3SA9S/jl3m9lCBrcJe1/sBRyWLLSqRMBuuTxT5mJdNZZni
         sYo1izj3l6ptsaTZYCuLpfUgDNZtKLGPa4ysJdfV5Yvc+mML/5RElZfFbvGazsTh5qD1
         E6+msdA1dxmRntK4BMjPS4x7RmgG+P/nlzQxMX0kWVcwLMeoVdnoCNY0AR4fsA6bEyaD
         i5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404841; x=1731009641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkl3TjMzcf3dryOCaAILRFpWIEyfiit3GjcJM3g5SKw=;
        b=F9aa6ngMc0zK6rPIAj0STrKicbO1dCDJ9GkWfWJOsyhmiYlMAoCb9dsw0arhZuq0+W
         9zJMRJl/5qw6jBCathmdnsEl5sR/CgNW5yEVCdYCY4ryJsMKxZpOOSNPEkFrmA1ZSO8F
         a14PaD/gjrR2z58BVyVfmQtvQuUwbURqvQCMFk69VIfbn0Yw3GDu+RVCHTWLKHdkWjrt
         JsoRix3iDJyaSeM/GjrgeB8IngNKFfvnwfvd5R+BJSO6K3xmC0EtFTKlFpVPLYd429Q2
         Qy8+U7FOTjciwuBbGuREPivxBJjxXOVTvZxAk8MLNNpiA1rwVQROZgurvNFQvZYpi1Ng
         ZWDw==
X-Forwarded-Encrypted: i=1; AJvYcCXaqGrVZtAkrVrkpbp7R4Am+B1La2guvRk5THEZMJSn6B6hu4X9PGsW7INwO/D62ExZGS6EpYJD5NeRu38=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTYsQEe73A8RfFrt16OCebcmIh0R/MVh84ayY7iJBCUjtOnV3X
	EPp7E1XTt4Tc08BQyBlAmCWcS++bzVbMGhTh9mILAhILiZh7l8hUi4tmqBlzej4mbevaUCBcyLm
	u3xTs4Djv+94GMuzp/reSO5YQWqKM95s1ihUn
X-Gm-Gg: ASbGncvZw+Drz5+t8nzLWyq1FHgRkVcXISpEkNvldhX3IllOw/rD09kRtum2Y0yTyCp
	balyqWnyiQIUt3RhO82yctScaCqCSu0YikzQ4my3W0BHmrl7pNNwNXLa0ux4UAA==
X-Google-Smtp-Source: AGHT+IEW2y5lzn/VGPepBdOsO+AzXleOvvzprjMKDOQXm2ENavWPeRp4bswreZ8MVte2QFNa89v1fS8lAyebQn8YFdc=
X-Received: by 2002:a05:6512:4024:b0:53b:5ae5:a9c8 with SMTP id
 2adb3069b0e04-53c7bb8e9f5mr385129e87.7.1730404840475; Thu, 31 Oct 2024
 13:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com> <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
In-Reply-To: <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 31 Oct 2024 13:00:28 -0700
Message-ID: <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The question is, if only extended moversions are used, what new tooling
> requirements are there? Can you test using only extended modversions?
>
>   Luis

I'm not sure precisely what you're asking for. Do you want:
1. A kconfig that suppresses the emission of today's MODVERSIONS
format? This would be fairly easy to do, but I was leaving it enabled
for compatibility's sake, at least until extended modversions become
more common. This way existing `kmod` tools and kernels would continue
to be able to load new-style modules.
2. libkmod support for parsing the new format? I can do that fairly
easily too, but wanted the format actually decided on and accepted
before I started modifying things that read modversions.
3. Something else? Maybe I'm not understanding your comment?

