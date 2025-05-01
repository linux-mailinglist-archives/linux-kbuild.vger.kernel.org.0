Return-Path: <linux-kbuild+bounces-6827-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E47AA5988
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 03:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9A2D3B35A6
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 01:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459BC22DF85;
	Thu,  1 May 2025 01:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BGzyitI6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1810135893
	for <linux-kbuild@vger.kernel.org>; Thu,  1 May 2025 01:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746064675; cv=none; b=eIWQ4hwlv+ztCJiuosORHjufFzCp9Vl4vNnjJOSPANakV1XPAkSUqb0SvLu5/uZLFYLZwRoivTMsrBBHvcYPc1WhVyQ2WKE3HIea3LhXjjkaAo9Jy1q5YPsNvT4x/bUQQ+r6Z+vb97t1DNCD+/S2ofq6U+ulsFZqwe4TE8v3n1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746064675; c=relaxed/simple;
	bh=vNNOALAKojuc1IVmn4YDr6ggA0d46EQHEfPXL/A816s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpWblfbqD3s8p6py1IP5QBKc8rcCRKvznkVjhFaK5y/wqD3+5N4Q/a7i2YDbT8yEnFKVrN7xtlG6E8NjM91p4PrHDoH6xPE5eaArIrdOfDql07E62vk/zzUmanJ14pn6kLGTaY+9bZyY5FJODzzhqlvLUj8WyZX6CkMgr355JZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BGzyitI6; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so931523a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746064671; x=1746669471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WydL3B0dnp8hxEJArR4oBSH0m050M1di9pDwlQ1+3BI=;
        b=BGzyitI6ozCHnhv+OQNFwqhSBNFD69OaFSNft6SaqFrl8mUDURT2YHzlFQxF66De2x
         fWKFYDOCPcqvVFhEdakqmJ2FaOAx0F4ycMv0FbenfGKXI2hI0W8vOGqXxl2jmePMHZol
         HYiXj7sieNj3xisZo9v3kNyxHganRIpnnsDS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746064671; x=1746669471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WydL3B0dnp8hxEJArR4oBSH0m050M1di9pDwlQ1+3BI=;
        b=bPEJJT1Kg5WBCv4D7bdcFbCTbAbNk9xLYlrbliysxnQVu9Mjc81eEu9K62McrI9g83
         Jz9qzkVT8DTNntZRirGZkcDSiwD3s+xZ7eBDbWGIwPSZeGegsRxyqgWkgNsEz1hwpBsx
         zIE+zUAPMAUcNAn9fnUIgHtsp7ZObMK6ayloB76kOEaNYIGGDm5bnExSYRuXmvzz6y9q
         PMbNeZ+KuzZFu6VnRPXJE5f7P/VLIYEfMwbGTk7Cj4ticxXqDDFa0qZ6SPgf2DocjpNF
         E6i9lOmT9dLWPdEDKDD7x1D/PMsXnJ5Sm3cKkubUcaz4YynfqWhXwtCSO7bsy8zOE8TK
         TxgA==
X-Forwarded-Encrypted: i=1; AJvYcCU6O96j1demrTuKBq+3ra1JdZu7GbZtS/7+S1VKRPYlPGCsUi6TmBccXkDo7DqdaZgPB1vjYajxqNSv2EM=@vger.kernel.org
X-Gm-Message-State: AOJu0YycI2zq2R3FojmpDiGP9yIFVgAlt/yzjIrGcP5SEM8so6kaZTRI
	ZvBePQGG87ISKBV7nma/OlCytceuxbFen7yQETsez0F8/6U+oKzcNR2ROjgwjHPW11I/fUJcxce
	px2k=
X-Gm-Gg: ASbGncvh7EoVl5JKCfRjcZgHdVrPs08KDNVfKfQpCWcjR03paAjyQwDINa9xzK/9jR9
	zlc8eLqQqd/M+T8y8HC88zvt1QY5un1IyPkipoFer8etxHFtgKlOGhaAaX1oVlZyNqN8Rh+cYW2
	K3W6GUlnuVqBbcknIBa34/SsOPyEC/dK9lU7LrSMtj+SaVf40fQyC127wueMpSEWcnO8DH8mYmX
	GCUK37cJtFpiHxSoLRIbk5cS9UTxnFIA6oSeYxQl5XoCJXytxpzAONtW0DcKJetD0OOgTLoN9G7
	ER2Y+nvYb8QkkJ4RcWWYbkodH7VzdfFoAzjclRD8C6YqHyzlzozJN4Iu6SUNpJHTqqmm9G7fPQV
	IhX1+CE9du33uM6Q=
X-Google-Smtp-Source: AGHT+IH48aY8LEq9K5ki18hqmGGDw/NtMoNjWi+FKgelOzdHXWCc47OsO6tZphcUIix30VdE6iqIlA==
X-Received: by 2002:a05:6402:1e95:b0:5f4:9017:c6a1 with SMTP id 4fb4d7f45d1cf-5f91350a9a6mr1139297a12.25.1746064671168;
        Wed, 30 Apr 2025 18:57:51 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff812sm9833979a12.25.2025.04.30.18.57.49
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 18:57:50 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac339f53df9so102243866b.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 18:57:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK0Et8xSzSLcS0OyhYgKQgzmuk40eLYfQ0udwXM505wI8L5Ye5Qhb9CL+8j1bnJMIOzLajuwaXglH3dzQ=@vger.kernel.org
X-Received: by 2002:a17:907:86a4:b0:ac3:5c8e:d3f5 with SMTP id
 a640c23a62f3a-acef4299d67mr153004566b.27.1746064668786; Wed, 30 Apr 2025
 18:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-unterminated-string-init-clang-v1-1-10eab729bf3d@kernel.org>
In-Reply-To: <20250430-unterminated-string-init-clang-v1-1-10eab729bf3d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Apr 2025 18:57:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHt40bxkx=1-2iecw32h5i8GXi=zpD0nUVdZxfh2k8mg@mail.gmail.com>
X-Gm-Features: ATxdqUFgZ1ZDKZdSgMYuRCt9GwTeRVMgI6qtOB7_7i5pEIVOBrqHEKYehH_TDJc
Message-ID: <CAHk-=wiHt40bxkx=1-2iecw32h5i8GXi=zpD0nUVdZxfh2k8mg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Properly disable -Wunterminated-string-initialization
 for clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Apr 2025 at 15:56, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang and GCC have different behaviors around disabling warnings
> included in -Wall and -Wextra and the order in which flags are
> specified

Ahh, ok. The clang behavior makes sense, even if it's obviously not
how gcc does it.

Will apply. Thanks,

                 Linus

