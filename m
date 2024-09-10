Return-Path: <linux-kbuild+bounces-3503-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F7974498
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 23:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EAE5B255FF
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 21:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770DF1AB507;
	Tue, 10 Sep 2024 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IMhGDA9P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F201AAE28
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Sep 2024 21:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726002641; cv=none; b=QTAY385bU6L54Xn9zFJGTi515C+trhCaCBp3k4lvkyck7pZJ0NlWqmJwh5rINeP0JzHq4fIWZzQnVGTLaIUnY34hPnyqKGmvfyl2lnWnYKjYpdbuCaGT1n70nd+iJoozAJERf/yIZW091dBEaOGI3PusQEGHIeBDAz9JYqhS/u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726002641; c=relaxed/simple;
	bh=XE4+e/G/h/a5BwWjufqCbsxsDHKt/oX1Y9qt8d3awZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBkhpHHyRGr6GOGU/HWLY5TEzUYMfPVqGQ1DxZ2Z+5EM5fSkftyalbA/JWRULAeYFapHnvYlEAkq00sd3Q0xwjEq7kwThcm849hhIr9N2j9ubEYMvxXxmm44NYlPPgAJpGXuQbe1zEU8EQTAhAZZ12Eyt9tI0jspoRwHl5Vo9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IMhGDA9P; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5356a2460ceso35850e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Sep 2024 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726002638; x=1726607438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XE4+e/G/h/a5BwWjufqCbsxsDHKt/oX1Y9qt8d3awZg=;
        b=IMhGDA9PtnhJuDgWhIt+osY3utDErZQrpGxHQX1cZem8XR0WPXUblvyuMwCTQJ3LAk
         ahZZKFHV1qNYkYDe5Leg0qzlS9pghc9TOwrV8mQtndbl/yH7+YoEZ8FQNnDoFmEk+k9o
         nozManjiVRkA6fsjKSbk8d4W1GV3RvH/a62Q6SHHfFQygos0MNzXua6r7NOwAl/Z7oxd
         aRq4dNhX9jImXn/M3fjh3iIlh87Punokkgk6plc6zWnCO1CaaWFCtm3zhrsxMIDLVF6M
         RLluowyvXNv9EQbPygBLYbD8AVqYi04W3q6QJmfHKE+aQEFZP7iequE5UNCH5DB0RH+m
         A8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726002638; x=1726607438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XE4+e/G/h/a5BwWjufqCbsxsDHKt/oX1Y9qt8d3awZg=;
        b=K90i6VR3y1QJGDOwTXgd5IWpssCJ3p/X80VJQS9C9a+CxO3bbYyHNYPJk4s81tEcBD
         pkwYy05YLylXyR+20XJLcQJybtDtn2j43S1DWcMe/XrgW3+STFrMPshFuLlebtO0w1br
         MsfK9FqDftohyc2BARDEtgj9E55ym65zR4WwvS5oCUOHGiN/TKTvwSi8qSqxrsk8cGHS
         oR2+MTnhTiY3RPg7pYjAzueYFGbbXTOokD8PBmvn4J0cnx0x9Pg59DDvkddmXopjbs8p
         RWbdHShf8W2zBag4NzC317znViEtCMk36padij8hrOvSXMBlSzoNcxMBHIv63DVIRfbN
         BGxg==
X-Forwarded-Encrypted: i=1; AJvYcCVsWmSypg1pUGxXLXd1YzTWuogH61wURE+Wp0tYa4jjZyRINKK4hoHk67t21Rv8EGsTiNYvq4v+TpzG118=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZKkilmKws4wHm/bVzIK/9hufvt/DIHpwCRx3ab/LD47IXnWb
	svIf440ZpmCpiBhSp3QqWxAjNfr1VBVnHhLB36HZHWGItiuC1bmDp9Hcg9iZqEkWk7E3GFpQnlc
	jsZeZ9RyEbhi78dkLho2u19ntHyyzQQtVROmw
X-Google-Smtp-Source: AGHT+IHIo/1g0cKAyt8QSBLpZEYQTEjztdB1IERh1UKFzCf1Ts3Mvd2qv8bZQ+qVA3GI1MbRVcan2+yf5xHv8XmvNuo=
X-Received: by 2002:a05:6512:3f14:b0:52e:934c:1cc0 with SMTP id
 2adb3069b0e04-53674bbe0demr32143e87.7.1726002637398; Tue, 10 Sep 2024
 14:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
 <CABCJKucott2g8mZyJ0uaG+PdPTMsniR7eNCR9GwHpT_kQ+GFvg@mail.gmail.com> <CAK7LNATyv+zfSwyykKQrSjxR84ST0xTyEarnAudF2VuLPVxqnQ@mail.gmail.com>
In-Reply-To: <CAK7LNATyv+zfSwyykKQrSjxR84ST0xTyEarnAudF2VuLPVxqnQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 10 Sep 2024 14:09:58 -0700
Message-ID: <CABCJKueSe0TT7HnoJULVZfz6t8x0WjkWksZ1hzBY7SZQm6iYgw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 2:44=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Sep 6, 2024 at 5:53=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
> >
> > Thanks for the patch! I think this would otherwise work, but I also
> > need jhash (or a similar hash function), and I can't combine the
> > tools/include version with this, because it ends up pulling in a
> > duplicate definition of struct list_head. Would you consider adding a
> > hash function as well?
>
>
> I did it as a part of my kconfig works.
>
> Check scripts/include/hash.h added by the following patches.
>
> https://lore.kernel.org/linux-kbuild/20240908124352.1828890-1-masahiroy@k=
ernel.org/T/#mea41ff4c5b6c77aaaae1ed9dac6723bc2f705107
> https://lore.kernel.org/linux-kbuild/20240908124352.1828890-1-masahiroy@k=
ernel.org/T/#m9050a270fedb7df9a54e843674bc9ad8fd068f57
>
>
> I think simple helpers are enough for name_hash and addr_hash,
> but please let me know if you encounter a problem.

Great, thanks! Looks like this should have everything I need.

Sami

