Return-Path: <linux-kbuild+bounces-3835-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A1A98A706
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 16:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908922829AC
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 14:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BB5191484;
	Mon, 30 Sep 2024 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4n3UHiJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994BE18E758;
	Mon, 30 Sep 2024 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706598; cv=none; b=LgZKrHCcEq79NbQVCHT3s7dZRyEaWrGX3IsngtLJJbCl9ZCzX2e9QrVNd+gtVo61SLmRq2wh10vBNurxez/TjX+X8ZRJqqJlJVo4ywqt45/tVCYbw1UNCqMnhp+VP5LiXSqmv3ZhTTNPA+6FCcDZCCyL4BAaM/wiHnQPJXSbfso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706598; c=relaxed/simple;
	bh=Rp5uKjFHFuilMkiE7TIxmYebYiD9m5wOVPo1nV3iAVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7Zj3U2ToUOp1KJSQsd1Uk+k4TLyKQYSDcpUXmGG1wcAwQgJO75R9zOye+8h5M/ej7+dOOr1G7Lh55vm7buwr6emK186BNwrfUrNueMJN1IVwDsy9KmsGJrI6vKmSeYETe63q2wf0+QSsAtq/TUOFDaNKOY3UErz+H5VKztXhhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4n3UHiJ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-718e0421143so632836b3a.0;
        Mon, 30 Sep 2024 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727706596; x=1728311396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp5uKjFHFuilMkiE7TIxmYebYiD9m5wOVPo1nV3iAVU=;
        b=Q4n3UHiJtM9pQjtMWXHpxoK0jMGFOP6nreJ+M/mGGKyI8jlnKKzrJU4xEJGehGcMos
         p+8KRM37Ua9cIOB2eXQqRo0HiYNhmmMbBqtCrtdIUfqW2IoUI/YTg+QqqJIF6rd1fNVg
         qBWki+LqEzUq+E22gRdPW2aEyavV6ctQ7VQpDHm2pmPDj5aysruQZtjWId0i8vndpPWp
         vlYsEibq0YvVnwQNid9wFvgnHhSCYRHpsngjShIXohREtwC8c21JI6/rxsQsWj7afhD8
         RnpqW7Re3uKOaWH5CqBbw/X8glrUt3hJlUdyKRHlEKnVBObIVR2L44wWc9UAtdedAagC
         8M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706596; x=1728311396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rp5uKjFHFuilMkiE7TIxmYebYiD9m5wOVPo1nV3iAVU=;
        b=nzKTu8elTq2eWqjCkSgYedEcQ/GBfk1vz6bGFQnIOVjAwTbCzlyr2jcT4nwVmUE/Iw
         t8/rSpkZdYDBzcCnp26wh2IyjzcmwyrsLHS1mk9Sc+TmFk5X8EBH7ar2rz6BN0+AwPK0
         cXNA1+Yeh5aST6eDWl3JoPWpkECWWS5kAxPTLtfd9LN5HuZVP+1tjaEqWnby3/kkKmRj
         n4JOjVuxAfSe/qpVpdclnDzwOIPYP1gE+WGoGlxuWmxXtMWwsCT5WhT4lzUJ5VxjF0z9
         edpypvelj1VxkZ0L0fZ8V5K0vDS71q5hebWRuIM74vmCDBveHSg4IKsLf2oU9IGufNKj
         gQOw==
X-Forwarded-Encrypted: i=1; AJvYcCV9PCavrOtyPjxKNqhlghuDWgTutTsICrINsGD6H8D8hHx8TyeXcgGg5xiJQtls85vByxAmUPaXna/YyRX5fkI=@vger.kernel.org, AJvYcCWy5YzD4Jel0Aaayxa0clvg+FJB7zIpZJ2YXC2Euxn1/KasYK/ZhgX3OzH1yb4ty3jble5erohdl7opKrjr@vger.kernel.org, AJvYcCXShS/UCAT1kfAODjCQDfuXEQJyBpGKRp9KkdNPso6AKFpzSKbBNhgEyB8CQS33s/Oatg3obV83fb8NxZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGf58kK85PvX+/qnzd+sPl3104uFaLghDdGnM0Zhm5VHJHI/zM
	KYVLuE3+0WkXMuvhdCF2LOo9EGd8xoK7Rg9Dav/qzj9pYuRLA9eZrnxJ6CnLvmIpM7uIUu/wqB9
	sg3Z3qnTF37iDh5psMKk1RXbB66NDqCyi
X-Google-Smtp-Source: AGHT+IG3SmvTus/H0mpNWKIRwZdV1RUhLilxHvRaStvGClbl7wqoxth1J56tJ815zLX2+pBSKDyeBQpV11+/JNYF/Z4=
X-Received: by 2002:a05:6a20:a129:b0:1cf:4c3a:162a with SMTP id
 adf61e73a8af0-1d4fa699bffmr8782391637.5.1727706595901; Mon, 30 Sep 2024
 07:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-8-masahiroy@kernel.org>
 <ZuwJlaeFfo7CW5dC@l-nschier-nb> <ZuwrTJftLlWNtrFs@l-nschier-nb>
In-Reply-To: <ZuwrTJftLlWNtrFs@l-nschier-nb>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Sep 2024 16:29:42 +0200
Message-ID: <CANiq72kcoJpGB1r++Hbd-4V+e5Ts7-WyZ661Uin+oYji9HrdzQ@mail.gmail.com>
Subject: Re: [PATCH 07/23] kbuild: remove unnecessary prune of rust/alloc for rustfmt
To: Nicolas Schier <n.schier@avm.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 3:47=E2=80=AFPM Nicolas Schier <n.schier@avm.de> wr=
ote:
>
> oh, there is still a comment about 'rust/alloc' in Makefile that
> probably wants to be removed, too.

Indeed, good catch. Please feel free to remove it in this series,
otherwise we can do it later. Either way:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

