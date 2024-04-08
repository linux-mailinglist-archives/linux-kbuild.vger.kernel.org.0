Return-Path: <linux-kbuild+bounces-1483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9A89CE2F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 00:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E88941C214C6
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Apr 2024 22:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D3814885F;
	Mon,  8 Apr 2024 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S8pXQEhJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC01482E6
	for <linux-kbuild@vger.kernel.org>; Mon,  8 Apr 2024 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712613622; cv=none; b=PpLgMkl+btH0u+HMsnL87NqJFeplCQ7QwUWQJANfLuRPIfX2LazKNObadWEhT4H3ve6TkwzidmAQoq5+fTW2XBgNimRe7eu21ZRyO4uy357rvSXLfVwOc/SBsHpv0UZtHVd5JOvFKyKxCUVPTMc62Fq527gZzggBLsctNEmCmX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712613622; c=relaxed/simple;
	bh=PWS489kmchIcHKmyqvVK6Tbd8mB/KG6l2if/1ML++m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI3u6sByWNJbn7d6gaBNxn0E9Ql6OMgPAJz7RrsSBGDX3ZIsNvdqXlwj8N0ZtSAg1dyBRCxRoDt0Ravz3qfnrwKbr73YC85taJiohhMMdnOfaIjy5svjD0BKAz4dGcOaAbHLAZ3BRamzx4ou5WlekvJwogq2QsHMzMv07JzDtgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S8pXQEhJ; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-222c0572eedso3093778fac.3
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Apr 2024 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712613620; x=1713218420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rM17DTMLvs+d4icBG3QadGPxpGJCsN26mJq8GhmBxnE=;
        b=S8pXQEhJch+SnuusUGn7+nLQHTwGwR4mpCok1Cv9SAL6Uqp+Rh162DH/WVEu3P19p+
         suttJT9snLQVJ6EZbk+HUtqpCHbs+VQ18oCqid574MgwG+tt2k4A0Vu/EO0Y6msz7RbJ
         JsMhFp3FCc/uEr/knR/cb8k59eecwLXwEObZ+IHb0BeO7wJQnN0w1m1/XxX0OC5sv6st
         wj4Fh+STTslU2sadzWZzHlAHkUWmqzNR+BYGi4oTO33W7VsUFiT4F8/iKUNd2qi1BYSq
         bW7B5kdK0vComuCyj+gFjDfj8DHf/UeTdbi1NVDmrh6AXtwW0D4KJAlK+1ysOSsDQXbE
         minA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712613620; x=1713218420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM17DTMLvs+d4icBG3QadGPxpGJCsN26mJq8GhmBxnE=;
        b=PJHcRHQaCQLL425W3qmSONu9ZI/T1gH3MX8k2FxY8yRBdCGkRxu0yil3Mnv1ePSWgo
         SSCULmLvpIMO948y/onz374a3ysFN14zvFGmODyMlI5qxuA02Tds1Wf1DMN56BiVnUs9
         horXjZUn44TJ2jEBsTkcXZYDfVlNuBs/RnCQXeax0Vz5v8iVgM2o/Qg6lDba9IgLEtlu
         SaS6o1nSxevJ1DhwKEo8aLyulpa+05avcXR6lX/QJldMM7fcEXdaz+oNw8SsvOzql1fY
         NF6y1/qj4h8se/hYJ3BJop542l7qkeCKcf4xKtlLLxmpajSPiNepK54U7ZnN1qyVGCPs
         HikQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOudPu4knakC5NF1aPUz4ptF7uwgQHuSg4CW9flo3PfVTYTfAUS+PaDieksRyis7ALPOAexyCjawbiIwWneoD9/fVGedislClLlzWp
X-Gm-Message-State: AOJu0YzBuu4ob2tw6kfAIRrshyBG6vdc8k+9loKzsNO5pdwRYKIhLKqw
	+aLqUbR/P8XsQy22TOUt0p1TJH4auvx2TPAQx6e40zaChcHIvDRokC+48VGJNA==
X-Google-Smtp-Source: AGHT+IFyicdHNmbgjMW/Eqm0AR4iX9UCHFCnTgbSuKVtXnnpb5cS2MCP9PCbwTgk3XP/y1KX76uoRg==
X-Received: by 2002:a05:6870:c087:b0:22e:9806:f97a with SMTP id c7-20020a056870c08700b0022e9806f97amr11596008oad.2.1712613619572;
        Mon, 08 Apr 2024 15:00:19 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id n9-20020a056638264900b004829e8e9456sm414370jat.20.2024.04.08.15.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 15:00:18 -0700 (PDT)
Date: Mon, 8 Apr 2024 22:00:16 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH 0/4] Enable more warnings by default
Message-ID: <qroq7fzresogvlq4y5o5pl4p6brhij6gynum4iqrim3kfy35xk@sgv3rtuu3uot>
References: <20240404151713.3493098-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404151713.3493098-1-arnd@kernel.org>

Hi,

On Thu, Apr 04, 2024 at 05:16:53PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I think these can now get merged into linux-next. I reordered
> these slightly from my previous submission to skip the
> -Wcast-function-type-strict warnings but instead include the
> -Wformat-truncation enablement, based on what got merged so
> far.
> 
> We are still missing the "kallsyms: rework symbol lookup return codes"
> and "firmware: dmi-id: add a release callback function" patches, but
> I expect them to get merged through the respective trees soon.
> 
> There is still an open question about the order of patches in the
> coming merge window: if some of the other patches are also queued
> for 6.10 rather than 6.9, this series has to come after those to
> avoid regressions. Maybe they can go into some kind of 'kbuild/late'
> branch that gets merged in the second half of the merge window?
> 
>      Arnd
> 
> Link: https://lore.kernel.org/lkml/20240326223825.4084412-1-arnd@kernel.org/ 
> Link: https://lore.kernel.org/lkml/20240326144741.3094687-1-arnd@kernel.org/
> 
> Arnd Bergmann (4):
>   kbuild: turn on -Wextra by default
>   kbuild: remove redundant extra warning flags
>   kbuild: turn on -Wrestrict by default
>   kbuild: enable -Wformat-truncation on clang
> 
>  scripts/Makefile.extrawarn | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> -- 
> 2.39.2
> 

No warnings for me on Clang-18 with this series applied :)

Is there some kbuild documentation somewhere that should be
updated/created to reflect which warnings the kernel has enabled by
default?

Reviewed-by: Justin Stitt <justinstitt@google.com>

Thanks
Justin

