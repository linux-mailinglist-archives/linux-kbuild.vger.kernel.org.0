Return-Path: <linux-kbuild+bounces-3983-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F75995851
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 22:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CAF8289F15
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3B9215004;
	Tue,  8 Oct 2024 20:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RahmmyXT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C37B1E104B
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 20:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418992; cv=none; b=dpHa6mBqVnR48HO+fD+jUnqnbFO4b/FYekvRNTouf+KmOQ4AFkmIc4LDatpaykjGH2iuVgzx9ZYC9hDc7sL8ZV5PSD0+21rcw91z+O6MVA2hWR3Is8Cpi5ieif2P3JmpRP82UtK/CdCKYvLnhNQ07JLGl18aHow48EKEdDiV6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418992; c=relaxed/simple;
	bh=aT/4Tv8yTS3tZk2OBCayfPS0Z48rZON+uEu5E5vyko4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/ijLDVnzRMEqBtivtcRe1UQIoP8IUOpHa0Jy9lR3pbjAR5Mc7XqKpXsy9Xa82YdWOqrQ8J/zGNutEm7zQ3dvqCeIImq9NbM12+b7tv7f/UTNHRdFsykdbXLGuYmhWeuH0E0F6gHdW0srjE5wA/wD1j+6ez0FoeUcmpMf/A6lQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RahmmyXT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42f6995dab8so73575e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728418989; x=1729023789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT/4Tv8yTS3tZk2OBCayfPS0Z48rZON+uEu5E5vyko4=;
        b=RahmmyXTzY5DB8NueEYj+fQpSk8ckdmdRyaNG5cyCBi21D1VvZzqleUcGStcODlAZW
         ghAXPsb7CBPYgBMCb6IWAoQ+1FADdb47huJoBLHZ/9Bo7QE3dFUB+yIf5HP4ZX+qhnuz
         SPWgPZJA6UwnEus/0SGl1mjny6FeFO7UjfVLQ1etZLpqMqDMbqHohOJ52sTo/gSo8ZQ/
         mkKxnenk4tAvCBznSxTt7dSnf0gyqm6UMckkviu9ivuBoHAHpMHZcMHsZpDwiCSwwNrd
         LAlZZt3OxBWpEFnNLErCC6ZCY6LJbqGd294cD679X/ugeT0Xk7DbbYO1khQKyelHhaCK
         Xd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728418989; x=1729023789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aT/4Tv8yTS3tZk2OBCayfPS0Z48rZON+uEu5E5vyko4=;
        b=c7IZE38AtvDEBAYV7N6m7AqVvTf9vOYNzcVpfye7mfQZODLDmhi6hjsmIk0/qQdBxD
         ZNr0GzJBTZP+CnUP3oWgoAPhFIXdlinjkiggCT6P9YI1KApoq8BTkXvSTT56WH07h5/I
         upiC1KxFLZ5MyGEk3If+/kY34iXdcZ+SVa43uAjC2oeG8u5fDP9i0GK5h/W2gOk4fTJd
         u9JHuMjjRlXXjHeAM8yZYhFq67mhtC5VwsD/+Xr9WsTvplUqafXZBpuY67F5ggLXT4UG
         L8kS3zigs5nAzMAgVYm6XgX84Fe5RfgtV3GZ4oKqOznW/EtzBtQxQEuraOW2TPkDLTRK
         Xuow==
X-Forwarded-Encrypted: i=1; AJvYcCU/CvbLew+5yYjBnzQybmVmSMOTO5vtXenphTtYv5aWnQI9irLokioI8ULpj1CNELomo06dUUNcysRWzVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUcbtW2dzBn6VmXmymbzLJOFipk4OfsInuf+vorx39rSShlMJg
	XdTxu+n49CAdNNqCimMcmbZB9tLxAvuXQXGXSnYMA9m8B3rP1KlCN1l8yWDCwTBNiT8RE/SPX7I
	CK3Jyo7th1xDHa0F4lmAydBwPSW6F9nh211+z
X-Google-Smtp-Source: AGHT+IHXUIQZjrceGy2DNmHGyshwanbOpVyVoM7Mm1vllzb6eznDdYZ2tcjUOfsuDhIr71bTFFfEmbi5dRM+rdEoMs4=
X-Received: by 2002:a05:600c:3d1b:b0:42b:a961:e51 with SMTP id
 5b1f17b1804b1-43058c8bee3mr1131465e9.0.1728418988766; Tue, 08 Oct 2024
 13:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com>
 <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com> <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
In-Reply-To: <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 8 Oct 2024 13:22:56 -0700
Message-ID: <CAGSQo03_GZCJrnp9WPxo2T3GJz8TCtucHNx6_rAr7xfJ6ybukA@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 1:22=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 8, 2024 at 8:25=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
> >
> > Err, slight amendment - I think you want `-o $$TMP`, and not
> > `--out-dir $$TMPOUT`
>
> We need the `--out-dir` to avoid temporary files being created in the
> current working directory.
In that case we should omit `-o $$TMP`, because `rustc` is emitting a
warning that it's ignoring `--out-dir` because `-o` is set.
>
> Cheers,
> Miguel

