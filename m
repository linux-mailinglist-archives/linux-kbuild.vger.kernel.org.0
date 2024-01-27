Return-Path: <linux-kbuild+bounces-691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225583EF1A
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 18:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD79CB228FC
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 17:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF78F2CCDF;
	Sat, 27 Jan 2024 17:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHfE3qFo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3344E2D022;
	Sat, 27 Jan 2024 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706376688; cv=none; b=hE4UoenKl4kT/oByKyqSQ6jszi5ok++8sCrRmjScS9MUdyDHG/tbNbxrwKhvqvMTNWO07P3xq3YOGuapiu0nXVy7cMV6xauuAU7qfMhmz4Q+9fjC7fZcsri/lzFoGgEq2Fc9rgNV9ndgNRehdHmLbthetzRCZnE2WYugvbP3kgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706376688; c=relaxed/simple;
	bh=v/eRmXnwcofzCLUu7NDTFXzeYjOhl/y7gybN3TxLwFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUAsnjFhYiZJWcSayj7RAynezHZGkrVKTdYg6vcL/QeaHrrL5ENGI9Ks+nfgVipOf9ULYZr05+fcBE7ZletOMrgHxh6iexJFA1FeeF0H48JOwBCzl5ECNLLNjmq8SvwLJ5+og3UpW58EiRqnUW8238eGX/X0SMZAEFu3/1GvFFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHfE3qFo; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so1215576276.1;
        Sat, 27 Jan 2024 09:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706376686; x=1706981486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/eRmXnwcofzCLUu7NDTFXzeYjOhl/y7gybN3TxLwFI=;
        b=MHfE3qFonuwSz2tUtku0Ze5d1ppntYQCLSqvhKrkmyhdQdxLCZFaXXjKSu7W4Hm4o+
         gnn66WzpuSPfj/yuk+uYqtOz7qQuxWmF/AVlvc2gtkBBmtCHKryxagC91jdhDz6BGxyf
         Zn7k0xtwf5aG6yUaNNu8LUKEL3mIMSTyl89jfWHI9Hc6GGuFQsrf2/N5QwsLhxjbX+mi
         W7ncG5+57Hhd7cmK6bGalbDD6uyzpWKt4KWR3kizqGzl9QJTI1LW7pRYQk4srWqku/D+
         3GJhxP+NSZi33GZfWiX4qiQy+j7v5GE6Yu5BJFwmfBJwliWnhBom5SVkURLWSzcGed4h
         x+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706376686; x=1706981486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/eRmXnwcofzCLUu7NDTFXzeYjOhl/y7gybN3TxLwFI=;
        b=T4ZdZUSOEZRaDOlECttGu3oWz05d1lp1baU0YlLBmQvc/yM84j21YQzvSDqrZrGc2Z
         zGI6cA0I+BfDVEdqSTyrVJE1iSou532cZ3JYeT6GllM+negueEKIV7/m5cZI/mNxbmfB
         FhBiJ7Vu30ZMPUUgXnOsM1UML/kjA1OEkfor3spvAVeHs6jDdGwZSILGfEuRU9m24fP+
         X1m/wSo9ZLFtzBq9nyBIse6h7Ze0lgwZpjCu2lWodsjXmha4at7CoHfRr/Wse0SqVwAn
         vBttDe53YrwbD9Hl7z2O86bYE+kZbHRMYR6TSlQE/PXRKU24GXZbrNQafh1K+eMMO1Me
         JZmg==
X-Gm-Message-State: AOJu0Yzyny15mlk2LSl3yHvnwttYPqeNv8pIe4Pl1ZwnWYcQXuSHH4DJ
	CNR2MozUmpLsYxTkVfMyS9XRvLGZnh1mPjeUH8soe3IGlVHSinLaj8UFZkvQR3i2oxvOHfLOWtJ
	9xYlcGZC5pbzPRQN5u2V78XZkd1o=
X-Google-Smtp-Source: AGHT+IGT6QA+Fv5einVWUruH4wFZtEDFhs+QsdbfleXhdDOmi22jhHOwpbUDt75IdkG3ywsAidiVPQmqlmIUB3+EsHY=
X-Received: by 2002:a25:8c88:0:b0:dc6:3d4d:c953 with SMTP id
 m8-20020a258c88000000b00dc63d4dc953mr823284ybl.68.1706376686077; Sat, 27 Jan
 2024 09:31:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com> <CALNs47vzQm5MbfJtMQR3p+W1xub3KHiNqRgEQGWT3u28fpQ-oA@mail.gmail.com>
 <CAHirt9jhbnXz34D-pmHNecMfkefL4wTr9LYj_V28OsVd=fkdZA@mail.gmail.com>
 <CAK7LNAQKxrV-oxouv9F6+_i9-oGvJNBzFNLo+5PdqwWVd9qWZQ@mail.gmail.com> <CAHirt9josVNzcwCM5Y3MsVJC9dz+iRg6r_64OK4NWPeOOo_X8g@mail.gmail.com>
In-Reply-To: <CAHirt9josVNzcwCM5Y3MsVJC9dz+iRg6r_64OK4NWPeOOo_X8g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jan 2024 18:31:14 +0100
Message-ID: <CANiq72=aO-786owBb=0m5x09nMFenRendPZxd2fnsa6_nZHHCQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: WANG Rui <wangrui@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 6:08=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> I agree. It would be great if Jamie could squash them together.

Either that or perhaps Catalin could do it at apply time with your
Co-developed-by and/or Huacai's Acked-by? I could also take if needed.

Thanks Masahiro & Rui!

Cheers,
Miguel

