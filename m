Return-Path: <linux-kbuild+bounces-9400-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 828EEC31C6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 16:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A529A4FD494
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 15:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E448B1A9F83;
	Tue,  4 Nov 2025 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5fdgbOT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735DD128816
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Nov 2025 15:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268688; cv=none; b=rVO2Usf7Vw95uhPKhuhM+nvw0fsezHOhF4YEdRD8AGk9JeAMBt4z7GCo0vXDFkO6X+fLJI/+a5E3IeDqlS6buPQ3UPDK74qWYkUw40Lp1T8KOf5l/gaHHppQYVuB21VZ7uoJGq3CS4LFmyUWurPXZnl0IFTSS+ycrJlM3Oj5tQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268688; c=relaxed/simple;
	bh=okDzLA0rKlu/eWRDRHJjHOAGrdR4PDVDj6K4aczpkI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ad32cRgX8agWulTQl/s6i2k02/rcLsD9GgFsdG1l7x2xaSQiRnjSb2L0N4xx4Rw25tWiJvh5xRVejG8wagYzmjydeqxu5loTSC5o1vY29o+TSkQblyA5U8hD1BQ7nO9KE4vF9qtzkIoyWiu/ujI4iIucu3WCdA3NnBcQrUJNDpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5fdgbOT; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-945a6c8721aso232082539f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Nov 2025 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268686; x=1762873486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=okDzLA0rKlu/eWRDRHJjHOAGrdR4PDVDj6K4aczpkI4=;
        b=B5fdgbOT85wPz82NIN2F5xgKI6pRtbJV6YD9gGrjz1wn6vuqTf79VlapwxBGVL5e3h
         8XUIvTrUr9sQDd97iHXws18BLeqyi77D1XI07qsInM05cGnLFPLEIWVghUMjOYB+fS4X
         uFmtRA6WLZ+15afkTcJ3GMWKXNFOEQuXUGSUOPEV/VOD7yoIj5zAdza2dXTxoXyVAVWz
         sVxVGU6TeZY63yUH9mspdxz+zo0vnsNv6OQ8x0FBfS1HctYbfteORvj5cyadreSKW+Az
         dxg//StdsXvNp5sNqdJ9MPclFdhNCEFUwcN/kBqQc/3p1jBqyK/5yo0rlDLS2OR9vzAC
         s2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268686; x=1762873486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okDzLA0rKlu/eWRDRHJjHOAGrdR4PDVDj6K4aczpkI4=;
        b=dHMzed2QuxG22Fe0ODPjpHS4uEEu74sY4VUHhNfTyIVX9tL3KRXyLdyYY45Lw+iiSf
         2LQxHuu/xbg64lVvVb26qyMzjXZEUghIyyDL+VzoqFgNa3XHWb1LoSb4LBSdInZLiRFW
         CtkIXjXIBL17HHQoOtZ6Hye7JT+DrJnx+mH/m38+ZA5wfwmwP+zrBtyESSdM+v4CHExE
         uX58DCfAWtRz6CvNerno9KxcIlhahVo9y2vKMYCUc8TIBQ8Qcii4uQQfeW65Qc2ZYpA1
         QGN4IPV42OWmx5sWF2gskRkjVGYiGHQCWewXeV6siLrPat1mbUytmD2+kT20+DgMv8QH
         hPdA==
X-Forwarded-Encrypted: i=1; AJvYcCV4YvUpYqd/Em4ex9wRLnk4Nyqsvmg8GZFf73DI7mrGlCtN6pS7bjhtBOgmNdQckGyoz7FbbGulG/L9sVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSsd4eMu/QrUmUL8Ckuh0JFXYzfVNnV5e/xKy34APBDe/sAoog
	bYjVbkrMeq0j/Ch+f9rSALyQ1E0dgAMbHwvffLy5sBYYT95SgHQI9YkmgufrgxD0z7N64hvwlEZ
	Es2OOTzXQLAzwThkD8AexNHwqxyK2OD9M7Q==
X-Gm-Gg: ASbGncselBBWg/bvIqa/E1PjwHMrv5pDKL8CBc/sc8cmU6bBB+4yzhb6NgMBCkz+GzD
	3KquBkkaYthw7DHJfyuHXDP0pQLEaLyqnuzYAAG0+CsaoyHa2vG017MxwuG+C9YbRlCK46GltDv
	SX8VnG8awo5swPntu3jCq178oRlSdD9E9mb6f+2xxstetp635rVO2j2wZdlvIFGdpIHCZskfFFU
	HueG9YMwDIDoo7h/+RxQlBfZpRKLbjgdq2siaBVsskjzjqFxOWhLrLx
X-Google-Smtp-Source: AGHT+IFme1pTfEydzQziDdy2EyQykRR4vemY0/WnyM1b4EpMZ46mlwlGLpvZrA3qhPubS5EEjG+eX9FV6LQRljXLY8s=
X-Received: by 2002:a05:6e02:1c01:b0:433:312e:e33c with SMTP id
 e9e14a558f8ab-433312ee500mr94236005ab.1.1762268686209; Tue, 04 Nov 2025
 07:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
 <20251026211334.GA1659905@ax162> <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
 <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
 <20251028174541.GA1548965@ax162> <CAB95QARtzDWensRzui3d-7+jhymcFBOBi78ev9LMy=ZFJMDCTA@mail.gmail.com>
 <20251031220732.GA2254630@ax162> <CAMj1kXF2kKyEOc6KSBfbdUMf5m4o=DLZXk4++C3q-utA_9g4DA@mail.gmail.com>
 <CAB95QARrcOc6h9=YTzLKkNE0dEaivtiLfK0kEQ1jNp+v1w4yzA@mail.gmail.com> <CAMj1kXG_kPx5=3Qbn6ZTpKqOYh-mehwrH+d6Bw8QEPqvhZy1nw@mail.gmail.com>
In-Reply-To: <CAMj1kXG_kPx5=3Qbn6ZTpKqOYh-mehwrH+d6Bw8QEPqvhZy1nw@mail.gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 4 Nov 2025 16:04:33 +0100
X-Gm-Features: AWmQ_bntCa_RWqs4DOisXRX6NiLdOvI_9lZ6X800v6KH4gYTYLw5fq8z4ZSVINM
Message-ID: <CAB95QAS__YYYBLc3KFjBUg_QqC3AOB0y6kvhSqZFR9fx7BDKvg@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Nov 2025 at 22:28, Ard Biesheuvel <ardb@kernel.org> wrote:
> Indeed. Not saying there isn't anything to fix on the kernel side, but
> narrowing it down needs to be done on the side of the loader, it
> seems.

Thanks a lot!

