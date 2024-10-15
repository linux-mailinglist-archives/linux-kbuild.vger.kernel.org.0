Return-Path: <linux-kbuild+bounces-4126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65299F204
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 17:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 157BC1C22A3E
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 15:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142C31D514E;
	Tue, 15 Oct 2024 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLLgjTc6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF2D1CBA18;
	Tue, 15 Oct 2024 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729007625; cv=none; b=eiq6VOJlfBC8rPCrWoCVpoYz8gOAElIiVRyAOWd4Jq81PPoO6xwMYcV8Rnb0VBZlYnHgYMrDewmxbYeuZRQRa+DgIhnuRJBRHfIO0tYUoRFQZZmMcZhrmDqUOJCPbpo8pnz1lWYw2eQNgvgON4nnd0vLdQcKeU3T1dREPooIEhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729007625; c=relaxed/simple;
	bh=XCroxmP16g5LieWOzyd0XevG9tSkSKSKPsUmqqxthxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cmep0PjApc9m2UUrcEyg0dEP1FPEJ8+1THZtenIIKdDecr2OXKFCcS54u+fAvydlEeq9ul3BPN3kqOtqQKUFSuyHJRp8ItIV+sBGYYJ04V2yKgbIwcNUcmHGITiNfDwXkCVO55ArP36/MLogsLuftAkxU2o/qRc7PFnA87KZaCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLLgjTc6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso69748211fa.1;
        Tue, 15 Oct 2024 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729007621; x=1729612421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCroxmP16g5LieWOzyd0XevG9tSkSKSKPsUmqqxthxc=;
        b=bLLgjTc6BAf2Z2Y+cPREeoK00ZmFlXwpvXAAe8rkB5F6UIAlx0CLujKfyjw+RlgKeH
         ouiCQtIM2nQ2MogzV3Wbwtv6/5/9aOeTe1/jntWICS2KP3XG2aBNRZsIB7hEqY/JABuv
         oyPuiEvdZndS5hixfUicquCJqtbdD/lox3Waf/zuJBjbb/xRyTk03mz+E32ScCtfs7sg
         a+SXPb5fLBqZ6eiU9fAGGZsDVAm1mnOM9GZ6ONMEBRrpxACGINuKoQFx4h1sdueYifyL
         6Qa1/WkejMdPj4SU6sVVuDGwGVHX9ORANUBbqms2n6mOAwXRDAOvExCttOXsATuR9/ic
         Nrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729007621; x=1729612421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCroxmP16g5LieWOzyd0XevG9tSkSKSKPsUmqqxthxc=;
        b=KGnm42Sbcej4JrL9wTMHMqkqQwD+Y1wKwaUAoEUwjXx1TwhlHj+kUdPKWpBp1meDeT
         a1eFtktb1fK6Yvqr7/ZGJOhuOIwA1NWciZP3hGLeZM1rY7ZCEwxQO50/POGBYQbDuust
         Ss77yROn/7xnM+LCq10TuIqy8YCP1nuS9ba2UXD0qD9HtwDR1iGl0bZueIz1cF4K9hrX
         RYXT3Te17NdGlWafW0GDMH7sEQTzk+Ltcq6kJJqExRIro5fWfGVnrxelsObnthukDuee
         zzauCCn5IpOw5JugO0Jwg+Xpe/WLaEFaXyWHuE+qJTWfO/8EfL6kKeX2xI4L1cSCVi7x
         88hg==
X-Forwarded-Encrypted: i=1; AJvYcCUWiRnsVjTY1Nu6QyHfSLxYyuRNt/cxbroi91CtURKxMoXOWek5A3Y+IalrqgVCC+oUnphzN4buJtwQUQOgRMc=@vger.kernel.org, AJvYcCUZOyw0SWfdS8q0Suw0pClfl5HOLE3fQau0JwuJKfeogYwGeIX3IpxWIhYuntkhEvXL8HDTQe6mKeasUSaY@vger.kernel.org, AJvYcCUw9dJ0ov5EqJcvDG7fAMSYST/eIlndjtmbzVErcGtAPxKU4SVbvErHGUVz21xxWcUFdwgW1ah0M+uVmZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYmmGGjmHKOQtJgDVe3TlwQ4woaQTsDMxUeLGSESvysAdJjzH
	k4unaO2oKcGodSDjdaKR4PTZyoJFHFFfvwNxF6ed/Og75uf9taQIIybXfi2HGmDKGbXco+c61/i
	0haircQJVSG59fROOqltAhViSzu0=
X-Google-Smtp-Source: AGHT+IFft0vihb1P44brRlcFMJA3m9oUaknSbFYSlrH+loum+22/xxBSO2MOhvQthOnOH8U8tjzeAS/ZcjaFN1xOUKk=
X-Received: by 2002:a2e:8397:0:b0:2fb:3df8:6a8c with SMTP id
 38308e7fff4ca-2fb3f1cf79cmr53366921fa.23.1729007621172; Tue, 15 Oct 2024
 08:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com> <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
 <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com>
 <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com>
 <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
 <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com>
 <CANiq72n6zkCZdUJ0A8enLW3BgmA_=eJKgDKwNCfs-q3dfeR2BA@mail.gmail.com>
 <CAJ-ks9==6mi7SF5rTR=YouwC6RwktJftqXHqhsBcHNTWxdbfig@mail.gmail.com>
 <CANiq72nBYswZs_m9Ky3KKNz_WmHrsSoRDJqcuHGt2WpvUogtqw@mail.gmail.com>
 <CAJ-ks9khX7Ha4iGWOkbHeXzJLPisE9r=+q54Z9HMQkojR=-a8Q@mail.gmail.com> <CANiq72=mUeMYvgfQVozr363juCuKmMVNx_13dj+q=3KKJ4DeHA@mail.gmail.com>
In-Reply-To: <CANiq72=mUeMYvgfQVozr363juCuKmMVNx_13dj+q=3KKJ4DeHA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 15 Oct 2024 11:53:04 -0400
Message-ID: <CAJ-ks9msDK9UAK5Pv2-TVWXv1-xYD3L0J=JKupN_Z5WW8VrX=g@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Daniel Gomez <da.gomez@samsung.com>, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 11:30=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> If a trick still requires a similar amount of changes to mainline,
> then I think we should go for something better/more proper, i.e. the
> idea is to minimize changes/complexity upstream, after all.

In that case v5[0] is probably the way to go?

On Mon, Oct 14, 2024 at 2:45=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
> This no-clean-files is meaningless and unnecessary.
> This line exists inside the "ifdef CONFIG_RUST" ... "endif" block.
>
> no-clean-files is only used by scripts/Makefile.clean,
> which does not include include/config/auto.conf.

I see. Was it necessary before this patch? Looks like it came with the
initial rust support patch.

[0] https://lore.kernel.org/all/20241010142833.98528-2-tamird@gmail.com/

