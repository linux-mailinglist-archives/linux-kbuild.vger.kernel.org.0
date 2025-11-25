Return-Path: <linux-kbuild+bounces-9850-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF702C86F66
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 21:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B35353B0526
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 20:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7262FB0B9;
	Tue, 25 Nov 2025 20:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r6XKd7Ua"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4A8329C58
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764101432; cv=none; b=SYDndCE22OUxQYVgo0W1WLKGyXzhwwPKkOBEzwxedh7YjKZanW+iOZ9EKkjBrDlvPZjdLykyUMXiptk4oLt4T73XCo7+4wwgQJ2gVcfcacZ4kcKpijopEtitmekIxwRGWd3UADf3++3rBN5Fmlq611rTTyKhF6thudCCsAerwdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764101432; c=relaxed/simple;
	bh=IpmkyWu37izB9U/urDTB4FMeYG+K+Cuv8K/u3LCvyYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOUizJhGP38Igon/i+gdTUVog45/a3dk8I6kTMy/26qPwv+/uZOed6eiRwFK2F05oC8DHg5roHJuRkt10eA9gYXsHYH8Z1gTjpt4r8wkTsRvRrsV61kMMUffwiiFa7YPYK3e7IbRKgqFbpEslxvhrsu9WFXXCEAoV9EwCTYTVOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r6XKd7Ua; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-295c64cb951so36765ad.0
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 12:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764101430; x=1764706230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+5vyqCrtY9XbVqcemX0lY7g/P4KxTFS1RrZs7bK+uY=;
        b=r6XKd7UaPy81HY4T8ChhRs0XIESXHy5xdnFVIvOlQa+zHomKc4QuXz6n6ueLegroZX
         62qJfSGXx3xbr6b0j4OXv4Vg/U+zu7ZVo+mjg2FfVU7nph2uj+SU2rv1/uQcMotMhb3D
         prENkAq0UzXLc6LPl2CJMj4+rlSmxdQkNGJx31U0iDjA+RbARG87K0CpkduKiG2spMPW
         0GSYg1V/IVS4p+AWbFBOfbVlBbCoCJnEHnMC2YovNlnI9Wnxf7e/UFjPM9MlSi/PFvgj
         13nEdXKJKd9PqKCbT2ZpGJb+DlOgxMtqGexiYpC4Z36HOSf+yNmM0JGbiltiJbQcG4NW
         gj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764101430; x=1764706230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+5vyqCrtY9XbVqcemX0lY7g/P4KxTFS1RrZs7bK+uY=;
        b=h3upo+vo1aGk7Fwvk+FM2RIGdl79E2kWslcNLF4qNm634LLv/+sywohOv/ft5gvxNT
         MhGlkrM2VhrPUV02Kf6O0b1pUQwssLsFXKJo11TZZ7+qzj9RGbiNK34nsH7VWyFK5RhF
         dumYIuDwySk1ZpxFpad8xPoHDnNXTtC0lAR7rK0aq0UCGMTQH8ltOZ+/1VIhsYHbjrej
         qp1gseijUFpCqSPh1AfMjptEQs/SeT0qjQyXySUj2h9DSHDOz/opwjMPQXg86vBWMUcu
         jt3lUcVccn8rpCF9ORKhrrcN1gCUiMSG94PwUXIvuF5aCVLK4ZN0UAdpW8ejK47xPwK1
         gY4g==
X-Forwarded-Encrypted: i=1; AJvYcCUvJFIFqZwZYrwrBhKMRYBXQkHJNqU1fy8ldFZOBsobnlJ1/4Zd2MPly4CI5PdTtmcpnjx8CCYKmgO96gY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiTiCUCsayU43nn8tT9vYwUrL+BY6hMUu99uka9/ty5B6pXOX
	uXWMsQ99X3m0jgg1030giqTk1hwwYoFaPTbdzHbdrNVebByQvii6oH9RaD+Xfw3eAAyDrsG4HOr
	g/iFI7twKJSyoDmoa5KPyqf3cBk7UTZl4nXWnC/Vh
X-Gm-Gg: ASbGnctLdJT9cUBb7ul7q//seGDxORvbquiOhTu1irw4ksxTSgkVNIdQ4Gb4wuAiZs0
	tvxtAbHrdcD6dGhAm1ApfwU4TdFUVwglDiOfjpiNaWKI4My2rziFmd83BvuBqBIFu/HDveJxtHo
	TpROQ2Ok6SBar18K7Vq7Eg25eTV4eRPsHyOD6udS7yJZ5Ahx1cZ/Ok2oADLzdsyy1fPd8yBRInP
	qxsfBr6f1AqIpfB3vswKivodw9xrlMmqqg7+SbDhRX5qI2cnYCiMnAM2fUnjziGehbT
X-Google-Smtp-Source: AGHT+IGna2ErKhNthbpSypt53IuMt3hgqHZlvYfXCyfz0EDoxhdTVpdJkiV9BuKUCjqG7mkLQMunNXHx2Y/iuXgA2LM=
X-Received: by 2002:a05:7022:a91:b0:11a:4752:4322 with SMTP id
 a92af1059eb24-11dc327e1femr21774c88.3.1764101429398; Tue, 25 Nov 2025
 12:10:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117203806.970840-2-samitolvanen@google.com> <aRycVOe5ZXSJJFpn@kitsune.suse.cz>
In-Reply-To: <aRycVOe5ZXSJJFpn@kitsune.suse.cz>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 25 Nov 2025 12:09:52 -0800
X-Gm-Features: AWmQ_blW6iMHGI7aTPQJK8iAONzA-fBA8_Io8bUpLEK98GyzR8N3QeVQrdLSgl8
Message-ID: <CABCJKucc0bxLJ=b9rkiwWts6uA=ReLFr32K1OP9WH51D-hO4+A@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: Fix build on 32-bit hosts
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Daniel Gomez <da.gomez@kernel.org>
Cc: linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 8:18=E2=80=AFAM Michal Such=C3=A1nek <msuchanek@sus=
e.de> wrote:
>
> Hello,
>
> On Mon, Nov 17, 2025 at 08:38:07PM +0000, Sami Tolvanen wrote:
> > We have interchangeably used unsigned long for some of the types
> > defined in elfutils, assuming they're always 64-bit. This obviously
> > fails when building gendwarfksyms on 32-bit hosts. Fix the types.
> >
> > Reported-by: Michal Such=C3=A1nek <msuchanek@suse.de>
> > Closes: https://lore.kernel.org/linux-modules/aRcxzPxtJblVSh1y@kitsune.=
suse.cz/
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  scripts/gendwarfksyms/dwarf.c   | 4 +++-
> >  scripts/gendwarfksyms/symbols.c | 5 +++--
> >  2 files changed, 6 insertions(+), 3 deletions(-)
>
> with this patch gendwarfksyms builds on 32bit x86 and Arm.
>
> Tested-by: Michal Such=C3=A1nek <msuchanek@suse.de>

Great, thanks for testing!  Daniel, do you want to take this fix
through the modules tree?

Sami

