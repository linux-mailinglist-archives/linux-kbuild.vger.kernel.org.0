Return-Path: <linux-kbuild+bounces-6939-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7EAA9B15
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 19:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D0E17A197C
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 17:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370F426D4E8;
	Mon,  5 May 2025 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImlAxP/m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40026D4D2
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467600; cv=none; b=XtDj/QgnwDzL0r2sWFej10Tecf0a9MGxsfwr/Bpw3rSsJWKOIAfJHqdZGk3vKzpPaWkaEN9b5SaP0I6Fop8ddzodbkPF3DKZYMnyVnVV4pex8cljfPBPZCj32pQKX9evwDpF6LgU/+kpyQfnqwJrYIZ9Fy+hRRYnFqsY3HKVwB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467600; c=relaxed/simple;
	bh=4jWZMMgrx8BOD028nnDmKgvc0BxRvNXuEL1nsB+f4zM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPlDX++SQcEQgwJ9obQDOl07FbJh6cr2uCYQKkF10onur54+g6AgVE0OJxRpN0qq3yygjjLadFjLyjami0bDHnwBOU/wlddUBWrSPg3lWJ/xFvuYZfZGI4AE5ipPSYd5hmKzGs227y8cSy2dbrWCe3pc+XUcUJ62ipuVQ75yd9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImlAxP/m; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso527669a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 May 2025 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746467596; x=1747072396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIwR6qAu+Bvey/IQaza5du35m3Eg4xK8Mez+Vcv0veA=;
        b=ImlAxP/mCA+r1xEATghu0LkrLduLML5aC+lYBPc894rRBdCWqcFJeUD6YytHTkmOVS
         aFbuP+WrpgJQAz1oC3X0ZAXjKAUlnLZclsLxz194IaSstdIPIAVOIqqyzpS+mptNvf8J
         YA/z4wVuxILAUBeVAb0LyYfHEdW+VT2KbG2t3xq0w446Jc7hkNL+6abPzd0wWv74WTUW
         /o04aeZ8TQOwI/wiSN3X6ogiQPwxVfQqNmzEwlDDLRohDGNzzwPP+mil3oq8fx/OHX41
         qjxgTztvVVjGQmtmnxd1BltVQx4dZDfQSpkaL5O3K6RBCJM3qyj/WgBuloPuDUNP/3Kk
         x4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746467596; x=1747072396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIwR6qAu+Bvey/IQaza5du35m3Eg4xK8Mez+Vcv0veA=;
        b=dxofLbwSqwZg4TyWboAV6bBn7H5u7TBAvDeRK0G5RylnvkT1Qg5vLsa7FQfSZEa4qs
         MUSYinUriYb970Xaim3TqxjzxEsggG/W1iBBGQ/8RnvtqiEwWCZ9S6jSY41X5eE9YJSK
         1Cec4iLSeCKekm11dV3EvrWLKZ/ZqTjYskPO6EVwFxQAA3kIHcECbuONgKGxHzSUMpZK
         QEucwCAwy+MLq8YaXEbmMsoVPbvdDBRMrLtyVWsatksWV7Hoh2HJJkfEO8WrZDC8UfFs
         gB+esfH+XM5f+WtJgK68IRDpkFnLZOwQeW/SfOIls8FS5loz1W9dw+qvceCIJ9OReT1X
         3NWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHL4PxvSidS1rQH5yD90iHDCTu8cxIw5E/j8uhzmfgYYUsHEXJRViDi7JkN0LbUzZr+Ij0j0/k/JMQMPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlL+xzPfNzFAIjtpy16vRY6abZvG13gCn1IOSj+mRhd2cQrNW0
	fcUIRPJvJJTfc2HRSy09le5M/eyo++qYNQUkl0VW/t5dPPP37bL7FllwuqLKjGl1fAg2yf5/vU8
	+jX3JeU0hoclhQTTq+Pk2PeXdfiafC3mJGiUNKw==
X-Gm-Gg: ASbGncv8w1TeKahSHLnT5lyOof9xLoNfB+TQmtcOBKWPWOYSq0Unv3XH94q+2gV+xwo
	DpcxJ/+U+jTXMZmTFxfkAMZNPBBOEMvezR1VmLWpz9Qk/9j8MXYz6fvVVD1KRgeyOElolr46zav
	UoYXzB6KC74XlTYJ1mCO8mx8+wkEX6hPdf
X-Google-Smtp-Source: AGHT+IGyNEo1BIuJEZb0X4O8m9l4f7/3tvck40tLZ2ZTwS1EbR+GRs3aMdtP7PW63nei7VhWOgWfBlYiq7bDgCLDX94=
X-Received: by 2002:a17:90a:e7ce:b0:309:f0d4:6e7f with SMTP id
 98e67ed59e1d1-30a4e6c3afdmr8248865a91.5.1746467595702; Mon, 05 May 2025
 10:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505171430.133971-1-omarlazouny@gmail.com>
In-Reply-To: <20250505171430.133971-1-omarlazouny@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 May 2025 19:53:03 +0200
X-Gm-Features: ATxdqUGmKNMgzRG8PU5tTa2hpfm9FVsj_8URbvCaiF5Fd9aPf89c_5nshP3NHs0
Message-ID: <CANiq72kLk3p2Rq904aUEabuMXx43Q9aQgXRXJwZMTxMMSAVFGQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
To: Omar el Azouny <omarlazouny@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Michal Marek <michal.lkml@markovi.net>, 
	Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 7:17=E2=80=AFPM Omar el Azouny <omarlazouny@gmail.co=
m> wrote:
>
> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
>
> Now that all the fall-through warnings have been addressed in the
> kernel, enable the fall-through warning globally.
>
> Also, update the deprecated.rst file to include implicit fall-through
> as 'deprecated' so people can be pointed to a single location for
> justification.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

I am confused -- hasn't this patch been in mainline since 2019?

    a035d552a93b ("Makefile: Globally enable fall-through warning")

Even if that were not the case, you would need to provide your SoB
etc. Please see:

    https://docs.kernel.org/process/submitting-patches.html

Thanks!

Cheers,
Miguel

