Return-Path: <linux-kbuild+bounces-4278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A46789AD13D
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 659CD281D82
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926E11CACF8;
	Wed, 23 Oct 2024 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTTqd34u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EC71C3306;
	Wed, 23 Oct 2024 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701707; cv=none; b=pOqyDGSyNjglo71qycUqDUHaMoi0KuLWaHBArhvdJWdWyXWQRj+F14zNt9GgWG7RdaI9HDCsco41vbBAKdSnsd3dhBrO2IPeDgw188ZEJ6PC7MpJqusRQx5Z2HhvEjkuGLTQZSHnx+gJ0iRFgFJ23KOQ4JfyslakL383hGBjQ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701707; c=relaxed/simple;
	bh=n3qCqyTy10lex7laz7NuPmEFiXmD12CtOmobdC5n7e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdVVOK2xsOVqfzbFe+oHN5uCzsXlBXRnqM0lqh9MuEXPtqToZuQC2sqejifLf5f+d8kaOv7z62eG/7hDp348mriOYgBsTyAxlOFngKZ48geOnjcfExJG9QQoZXuq+FnuhN9C22qFa28m0/Sa55NHqImW+5AfsGIJ9y8+tdXhWdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTTqd34u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B20C4CECD;
	Wed, 23 Oct 2024 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701706;
	bh=n3qCqyTy10lex7laz7NuPmEFiXmD12CtOmobdC5n7e8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OTTqd34uVSRGvqbo1mQyC4Xt49FbO5U3gytqewaO5cscXOsDmBFOLH0jMEWcynC/f
	 +t6c4VmBXAmpZWvolZi7wURKdgQHrdD04aMnY+FbvPQV9tmW5GTdTwT3bBlJu9tCYP
	 3eTFPG4fJIF3RQvZC9cExCohqIO1IJKAgyyxKtvom4Ka/aSvck3LKVhc0XHj88ep1i
	 vwHpU7+OVtKCmjshk8JxJt9oS9vda2yBZMKtUeOIpVOGn38+NrenYXH6txNBKilC6D
	 bAQUDgpiZ1KQoA8mnfoVTSqYleoOqoxfiISGdJVyWT04U01Rngbzqc6/6qc4cnBE2h
	 8RwE33YuE7AnA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3716422e87.2;
        Wed, 23 Oct 2024 09:41:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaaX+ommd0pjTOCGONJ0fLtdMpFhBiT7/m+7NzBMLbLrBla5vJAuvAvkjEsmaWjINRx0jOMjZELtO0j/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSEpZjh4zNU5ReEdd8zMVC8f1hiIz42CWlXqAkpaW2dMDrMV1
	UVenPtXMqqRoVTTSM/4G6VnqhpHt0hH4HVdUOYsPF4cwupVasu83VwcLa8DOQP1m5uY1iFLMamd
	DLolA05X5AZasvGaaYgXkOxA9SGI=
X-Google-Smtp-Source: AGHT+IHeVNVyeSqNM9Enb81lKkpNG3MzAyhLkMAss2895o/XFW4MQKZ82Tm+9lv4haZt/XdModeqeMe5dLzgyJ0h5J4=
X-Received: by 2002:a05:6512:ea4:b0:539:8f68:e036 with SMTP id
 2adb3069b0e04-53b1a354088mr2745050e87.34.1729701705628; Wed, 23 Oct 2024
 09:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <2286001.iZASKD2KPV@devpool47.emlix.com>
In-Reply-To: <2286001.iZASKD2KPV@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 01:41:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSM=EDgHN9=j1-BXoeZ5aq8O+nCZeBUeGrvhq2+1fQvQ@mail.gmail.com>
Message-ID: <CAK7LNARSM=EDgHN9=j1-BXoeZ5aq8O+nCZeBUeGrvhq2+1fQvQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] kconfig: qconf: use nullptr in C++11 code
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 3:35=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> This is type safe as it can't be accidentially assigned to something not =
a
> pointer.

This is incomplete because there are more call sites that use
0 instead of nullptr.

For example, you can replace nextItem(0) with nextItem(nullptr)

Anyway, I do not need this patch for now because qconf is
under refactoring, and I will remove a lot of code.

Please come back with a more comprehensive patch
some months later if you are still interested.





--
Best Regards
Masahiro Yamada

