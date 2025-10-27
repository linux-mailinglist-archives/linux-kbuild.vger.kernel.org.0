Return-Path: <linux-kbuild+bounces-9285-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F4C11354
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 20:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC050585A43
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 19:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AFD2D6E59;
	Mon, 27 Oct 2025 19:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8VS+K1+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676D124E4A8
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Oct 2025 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761593749; cv=none; b=hO1RGAKvgO8QQFAE3iQT9GtDxtHaMQCszzwNSIUgXkwClPdg1fJMA7O+MW2yVNgOngiXnkPl8NVPgtV/HVg91NlndYk7Uf7787QtL4gBB/ixsUN3R0/uuPchdlv9DBX5UZfSHNRPKEhsXj+m0JhuOtJBPaR5D+oXxr/qfdXpVLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761593749; c=relaxed/simple;
	bh=Xoj023B/V6X3Ah2oWRRk1SrS+L09yWMEB3QsC2dKGgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZrEEF6aTfL+JXBKnjU5ybSCZxC5N6ycywpYoACBRgYP8F2vgRiF7+YiESWPa6E3N/PeOoLTzRG+PmyfYar15fbwxu+6+IbiOGIZJGEbQXeTZQAqBOqxJDM2FXD8iJ7tGgLgP6BfFb9NQ8ULcoQNaRFvXzpK/ASZJdO1lo3i7rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8VS+K1+; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-430ccd45f19so54779595ab.1
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Oct 2025 12:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761593747; x=1762198547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MIt2U1EDF+lEVbThYG7zsgziArCGEJgNGIfSIGlv++o=;
        b=M8VS+K1+FfviTxSMTU5jgYSKIL/6Hd5+QG9XJ/XJ1OHzcPXRYTSnkrLA5iVXdUm7Iu
         t0UmpEjMrm6vOm60+U4E98JWV/f66zwAgIQfGo0bHtk12s1LRbUXaa1GAz/42wtUFZs7
         CwtKvpfoBrDZYP+Q+rZD5Oqzv7BQx+AbXhvFlAkJ0Oe/DGqdDTJG4Z5AeSa9kR7QoNf4
         vv8K9Xae9urUn3/21gX6GFclOcU06W7XAR/g7qroBGavR4MN8EDxFbuw357RvHHol28s
         bUIfD+y2wqRcjVBst6FJAgwwgJUgbUpo9sRofPYHfS1vswwTLqdolFCcjhMVd379TU2e
         oFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761593747; x=1762198547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIt2U1EDF+lEVbThYG7zsgziArCGEJgNGIfSIGlv++o=;
        b=BKQdqCdyPC259s/ViJOVBxPEiUiwD2yVM2mmiknAHDynXMdt69hGXYMnGtxi2WrjOa
         Vdz6dZF5N8KJZKrh4RerFWllk94C2nOsLcb1YEE4w1b9UjwsrYJHVTUth/1I5fMAbMj9
         KXvtDJ/q8342pu9oobb8vnb0U0StvRpXFz2UcUuc6e2k8QZqV4W5yQspOgSQWaABISi2
         AntAWIQkePrW4vybK8vp3fY84Har+61Cfe/lrXR0fiRSxTNv62+TPpErbZ3FcYOIJU7R
         Lak4yAvYIGUaANQC6eLKrM9UAWLWm4W/6F+8sAQVcIAi6xAvPLFp5Bvic3HzojR1Yt4k
         6pjg==
X-Forwarded-Encrypted: i=1; AJvYcCXN9zruS50owJBShE8M9Yk52QvRYdHeRLouxctmwdJGILrB+VwuFP0x5MWMowD0G53k+Bte0zoWckyyags=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSz8/Z/4t4C+y6/xJdWpary5DIP8tg0675qokjlugQjgovyOV
	4TR7bMjPr9ZtEUqV6IsKoN7tZu+bxXDS5hUt01kT1Y376F1MeveFvpHEN5c4uUlYVr2oDQqdAVa
	w4vZ57xKkf22HG51mtC7kN9pMNcCKvYI=
X-Gm-Gg: ASbGncvGu/lA8bbC8aLEYHZwZpfcZg9CM2Eu/9rMi2xgS9BMFuz7xx3mzW5q+TyBiKE
	KAOUsfWuZCjdycwnhAdM6Sb6jtdVnQj1qj6KO4DrG2kWSh3yQtw9aKJnzxS4/mQqyJnCmv+cY/G
	aGNkrSSlxlSFNP93FGhZVgjmuCDgnwGzgJsD4ycnqe50JaWP9enAD9FFbnpGnEUnDE3stp8Oe5X
	X9imz/bGBTFcaMro2voQOu7tycQM36V97N6b8WadnGPrgC8GQ+w7CHGGRmiWhpL0aPqiAXOMcbv
	mgrI5v25VZDBqf8OiA==
X-Google-Smtp-Source: AGHT+IEXCxIX5QqEWGoiy5/PF709NAtwqem4s7iWflESBuFsW3Fz+Uw56nse2/NMToWTe2OlYWWxOvazLhwZp8NAP6I=
X-Received: by 2002:a05:6e02:178a:b0:42f:8b0f:bad2 with SMTP id
 e9e14a558f8ab-4320f6ca803mr19882585ab.10.1761593747402; Mon, 27 Oct 2025
 12:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
 <20251026211334.GA1659905@ax162>
In-Reply-To: <20251026211334.GA1659905@ax162>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 27 Oct 2025 20:35:36 +0100
X-Gm-Features: AWmQ_blDqxQeU_Ky-v3nv9n-HPXGPvs6mQRSBYNlLKNci8X16CNqY4IhZSxzUBU
Message-ID: <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Sun, 26 Oct 2025 at 22:13, Nathan Chancellor <nathan@kernel.org> wrote:
> Does applying
>
>   https://lore.kernel.org/all/20251026202100.679989-1-dimitri.ledkov@surgut.co.uk/
>
> help with this issue? Also, does 6.18-rc2 (or -rc3 if it is out by the
> time you see this) have the same issue?

Thanks for looking into this!

Neither the patch nor 6.18-rc3 work. I'm going to try to revert
5b5cdb1fe434e8adc97d5037e6d05dd386c4c4c6 together with anything that
is needed to apply the reversing patch.

Cheers,
Eguene

