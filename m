Return-Path: <linux-kbuild+bounces-3706-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC1984C66
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 22:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B45971C229BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 20:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F7E12CDBA;
	Tue, 24 Sep 2024 20:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7b6Mj4n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053F026AD0
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 20:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727211008; cv=none; b=W7/oTKvxtzAsmfGucLI7FMuJMGKtD8EEhq2As1eCPF55ANKHWwmGJTHV0M1qUR0eA4b+eKFXQF135Y9pYNUidLE0mUsWJDrhedzLZHFIb8+smHPF29+4LJsVr+1klT8Wg3E6yCyGn3FXxkWuNUaV8kbT6MaMgFaz/zDt5sB6MdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727211008; c=relaxed/simple;
	bh=QvbzGJmOzQ9sCtNDGIQQxr2ASONVIU+1s2/ScD+FAO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PncejZbTDgNWFOUGRzOvXnqxUkhdde6VLp6RHOpEUBaf8UdodkPT+o72mWfGa2oTGp7zb0ySdv1iRfnQwN15i+S/1GvSeMYvBg8i3l+wi87mWQJl7IQoduF07lIhAKALV8p9Cct8r4mm8LIiFsXbCZ8FGM1wM80JA1bEseYvy/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7b6Mj4n; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7e6bac92bf6so120249a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 13:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727211006; x=1727815806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvbzGJmOzQ9sCtNDGIQQxr2ASONVIU+1s2/ScD+FAO0=;
        b=V7b6Mj4nQI8hP0Ztmj2xVzCDKX4IzGv89CZC4Dq6a8uV8zgCLypaXiX4qfCZfrc/65
         gqBFif8QcF+4PH8zdptDm+5rfwlWx1DQDMOA9kySGzCT1jepTXG4KTitsVj1+OiBDfd4
         dBSbscub6+XzrkaRxCK5iWZnVnIeP0rVX4q3sRc7htakPZOS8L+b6/jmc5DWeVDwSr/r
         0Y2dZaoAjZN4mnAJerU/YNGLkLlTBV8n2+BGAYNmeZQ4XgoeVIN5n+fq9A7xekl421Vh
         A0jHxEA8GeDuGrVfysdrOKhHW6iZaxxG5bvAj1iPEPXKC3XEZ33XUDjll7vg5W4QetVl
         KNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727211006; x=1727815806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvbzGJmOzQ9sCtNDGIQQxr2ASONVIU+1s2/ScD+FAO0=;
        b=jIP5V77FUvRxhRvd7clrw0ae3TgWFVpguhR6Uh8FnruTN9slmhzxT5keLXvwIzAcqH
         rlvj3Xq4ReJelwR5w3SGaWKHuSdCVZowi60XMtuFY6s040r6i1MRPj7oHSYJ0qSIj7qo
         BxrMB1l3HBgmsbPH2YVViw7yJsb/EaYeuOnQtzsNGkEansFj3dCYeYpNSslhGwQMrb5v
         VV5jlO2Vi84QvUll5Jhq0nkF0dEDh4Mlz7fq9X2dGuOVZcOI/3li92ZJN1XaZM+1eggx
         Mpxsud87U6imlKQfKpR1pT75P3NRo9+xOZOkRd7ZegbvU3VvnncjhueoHToE/bppkNWy
         BaaA==
X-Forwarded-Encrypted: i=1; AJvYcCXU65V7Jh3nVrKBoUygmgezFerjfBdozw4xpZ4IWJhaWtCqAaveRVBu5y7a3EERJ4MTTf5a3s9ZnBybiEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5cIlHQ018Zr2e8v/4SXtc9dMECgOO6eWiV07oKDnyM6UkkRts
	w9A4b2GG2wL2XRGRPEyAENy1Qh1ICrLjVX9GaM2IPXk91WGNgxLAUDPphuM/ODkMRprh9tzm8w+
	83+JbCDcwojjKA577gh/gU7VXtbQrCJyF
X-Google-Smtp-Source: AGHT+IHGhN81d3T8SPGVB8PMjA+aFhBSyHCS7vVbdoMemxhngSXxXs+aKR1zDGUG7i87aVoG1frfiGRd5RcidHwrvfk=
X-Received: by 2002:a05:6a00:3e1a:b0:718:e49f:443d with SMTP id
 d2e1a72fcca58-71b0ac63266mr347491b3a.6.1727211006221; Tue, 24 Sep 2024
 13:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <rxsikukdh39.fsf@localhost.mail-host-address-is-not-set>
In-Reply-To: <rxsikukdh39.fsf@localhost.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Sep 2024 22:49:53 +0200
Message-ID: <CANiq72nwcAAC8eGCzHZ_sOwccCqbg3KD6CraXj2r+hDwhYqqig@mail.gmail.com>
Subject: Re: [PATCH] kconfig: use memcmp instead of deprecated bcmp
To: Thomas Meyer <thomas@m3y3r.de>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 9:26=E2=80=AFPM Thomas Meyer <thomas@m3y3r.de> wrot=
e:
>
> Make build succeed on systems whose c library doesn't provided the deprec=
ated bcmp function.

It would be good to mention which systems are those. Other than that,
it looks good to me:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

