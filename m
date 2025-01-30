Return-Path: <linux-kbuild+bounces-5571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AE1A2313B
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 16:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28B73A6934
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 15:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E741E991C;
	Thu, 30 Jan 2025 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ThgW348h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83981E98F3
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252553; cv=none; b=s3dG5DMV6qxvvX+6CSPnWjSYPJP10xgaOZ0wbA0m35ilvNNPtsOY2Q4zstG9P9Ocehl8Cr8l+aDueTKsSJJCtXYoaSGBgDv6Sa/4qzIooRAnEWQVjpILNfrO0RF8GsEMLi72r7JcWs0Auq+SpAm8J8loYX5gtA46WdKd9f/KnPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252553; c=relaxed/simple;
	bh=pU1zgu3VyGVnXmoXtL1hak/fvrA33iGdz5knc0cTcm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtA9x4wIhdjzisgmcMH/QCBj2bFxDyMpsT68DdCPmK5EV49i7DYoQ5icBqaAQwGoXI8ep71DGFvzkCXFOS90zVarc2Lh+VEFK2+4yzojv9sYYm0EYDuFvQf0Z3sOcYF7OuW9bxer4zu6t7an3OQD8XOm28HbTjAdWGSTv/NUibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ThgW348h; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4678c9310afso234971cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2025 07:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738252551; x=1738857351; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gPuxTWL11JQJhUA2jK4STSm/0jEICakOx9XSDtMUZj4=;
        b=ThgW348h+asgiPvTn56iBQAIKfahPqqFMLEr6CE6VMGGUSvw7jRH6XwKq22oIBach+
         gqZIo7a6W3A/GhD0SqBAEi+JoXYuh6uyIZcMb8P6hH+M3XKNlBfDQ9MY2eidr4m+u3D2
         JykyYS6MsW5uItG5F7rJ6Tr9zF0KEoePYW24TVbnykdW3tDdnZTYFoYCbCrEMgsumj2h
         Nx6ihLe9ExckoZM23NkrB73vxdoqgBcVIuzwXFCd/3Md9KF1bw+P+PkR16B0z4zs48WP
         zA/fdH/syZ+JCijIHW2GYv4xr4ylSToGCB/wQNs3I4UR4W2re6/bwTqFZYwmwz/dkY6q
         rFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252551; x=1738857351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPuxTWL11JQJhUA2jK4STSm/0jEICakOx9XSDtMUZj4=;
        b=c7F3kpx+VEF6859c4oK1GonyUviM82rl2y8WFaPa03aG09LSr3aKJZMq8hxlmuMOo3
         5oNBXy7imhqU/hBvVWoVBwye/RlY+VckvUyJgY+18Yq10rmBgHwMoM4k9Ho/jSQFqImK
         PZSvgEL85uyaoQUoM8zPg2CSYI0FQiZOOM0K77Y0bfR74X/B68+Z37dviXeFiL5EkL3P
         DhxepYLaGuDMim0OstmBMJAvP0w6bRy272v48KmOzONt7Chn+XUSHmtQjATJcNzuYqz5
         rBV2sHowNNh9asC13YFhFvdvAawdfIaQaMOpyWZfg0/u/Xq9TEW/bZQNFryqojHPtgFE
         71ow==
X-Forwarded-Encrypted: i=1; AJvYcCUrQkUZl/XKf4EOVHOHK4fwdZcR1tQOSjsZ3+t9bv2jZJTWPhtHdi7kuLj/aZzOsuS+lqSEaxZRxBbkywU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1ZPjcVF0bCJHD9it656ED86VoiPCKKLjV9t8UBK86kHt7Jkx
	TyoPZ00NclR/pq7j4XEnrvgusKtQmiOGajlzBl5AXrn5U7w3TE2Y7Xn3BD6KSFMN1kYidUEiJJC
	8/ePTzodlG8D1gAIrn9FnFjw8qsgJt6ULcSul
X-Gm-Gg: ASbGncvStVKdU7KfAIIN1WV0tIYWAW7FW5uEsOkK5G2mAojs6jpOGFy5MyfFb2AE0Fe
	4AsVyRtOSdYgkoDMGnR6MjOrSWkCYbr7rsYT4aD7Q4FYEb+G/r+T/DB+KIeFjBhR0HQ1DBfu1Wh
	6wdV4ZvA4KXtg/E8we8zq2fk1A4q4=
X-Google-Smtp-Source: AGHT+IFHB7rKsZb4QjUNCVKPKyTgN8xH7+wfdczpYVAu5y18Gnq/h8yl/V7tXr8gPVhXTYeTkntGJAzy95Kno8A3oEM=
X-Received: by 2002:a05:622a:1ba6:b0:46c:791f:bf2f with SMTP id
 d75a77b69052e-46fdf5bc2a8mr3375561cf.1.1738252550566; Thu, 30 Jan 2025
 07:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com> <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
In-Reply-To: <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 30 Jan 2025 16:55:39 +0100
X-Gm-Features: AWEUYZl0GF5Oi1uY8Kg0VqJNObRxnZZ82Cfhh_LmP9Ajz9yvxxXObZAjbFFBRo0
Message-ID: <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 01:14, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> Thanks!  I'm putting it through bot testing now.

Hey Josh, how has it been going - could we merge the feature?

(Or, has it already been merged in some tree that doesn't go into linux-next?)

