Return-Path: <linux-kbuild+bounces-2312-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C1923992
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 11:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50219284321
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 09:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29489157A56;
	Tue,  2 Jul 2024 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoZ3W3SP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236115250C;
	Tue,  2 Jul 2024 09:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719911606; cv=none; b=q7td/pqvzOz9O0VyhUkD1HKXDNqAZ9h241yOo8Vbnp4X3YSgaEM0IVhDxobBXz5hgJljfmxU6AW2iwp8kuEVh3FhrXLPNvGMo34MuURkwV1gFmXcQp3uyH1O3fHF2yYyo6GGGMhEB76QDLkq2ZY2azsVU/TEhkRSKeZ4fE5wfYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719911606; c=relaxed/simple;
	bh=EN+fZczi+LadHo7pVDqIpgLNzdZC4KhXpnGwFBU+wLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hj7+5IeKZSfYJbXRU+ebGmDNaua68dNc8XVtwCxtERUSQv2SngIdbzbH36g5296cdfdALt0Z3lrcF4VYBf+4tAHAn1ug8ghzsoM4xqewg6uEC/HSa26Zhl/+GwfZKRzgK6sAFK19lc6NDiKNL0XtpRetSpmlbfBW9LYuKLwsyjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoZ3W3SP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB95C4AF0C;
	Tue,  2 Jul 2024 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719911605;
	bh=EN+fZczi+LadHo7pVDqIpgLNzdZC4KhXpnGwFBU+wLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qoZ3W3SP5tDcD9G2IkC1sMoj5usWsH4F/SICk8WY99glXkBaZXEIopKUOBKJxopfd
	 4bl7vp/0Iwr22BX7eS+0grLDVcSUdK7aZ6C3eOpoyaNUbl6cTyAayuNtEc8x2h0b8o
	 qDuC5A3pZg8KkI5iVzNtPxoXLW9Nc3Ips+dav+auwsO4tbOI7ke9b0GfYSFjT9tTI2
	 eqF0zNVfkmN2egAy/dYHcxT4dZnFwh9cBhtMLkIAjEWInxPKaWcpGpGA/b6xPKyaIW
	 Eanr9rZVgFw1RQRiHQbrWnLcgvJ5Bus45asSMNht+onIYx4mHr8YlF2545rLEZXd3O
	 pBS0antx30R+w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ed5ac077f5so46887041fa.1;
        Tue, 02 Jul 2024 02:13:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnM3iFTbHnLLpm27h87Rs5l0zUih0MEtCTHa2o9SNgOhLBS9VfjEkTUeVsj+vClvGKkwxuqbrClYDCAiFmyDIYu5Z5tHnPPkEUli2Lt9/UKjfQkgtbPKLD2fAjendVbpLw15+lPbMHxwNghzCA5cJBFrntAYrMlyFjtpEtOx68rwujoEORWA==
X-Gm-Message-State: AOJu0YwvPRRsUxqaxRaPSUbB/LmDNXbhHWVGQ8Lktptcqm1S/Bsh8gkp
	L7u36je9vrwZ/LQ70Yaw1itY3tlTvkf0y4Z52JOl01g0f8IjMrzOclcNnjn5M0dOnOh8Z1xn5qm
	ir1vrvllVbJ0Jp96dTRxQMymzG0I=
X-Google-Smtp-Source: AGHT+IFEe92tS+e/cecnfWoEsAPnErKNJlXt7cPyFBkW4rAE4bnXZGIxHYAcu3eFPFCqU322B0r9fAdlEYdhpzvPyvo=
X-Received: by 2002:a2e:a912:0:b0:2ec:4d8d:375f with SMTP id
 38308e7fff4ca-2ee5e3767fdmr57532011fa.16.1719911604217; Tue, 02 Jul 2024
 02:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427145502.2804311-1-masahiroy@kernel.org>
 <20240427145502.2804311-5-masahiroy@kernel.org> <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
 <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
 <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
 <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com> <803eabc8e2fa5dec950d149f83027fd204d5ef69.camel@intel.com>
In-Reply-To: <803eabc8e2fa5dec950d149f83027fd204d5ef69.camel@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 2 Jul 2024 18:12:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATLnRqLeisBOiWbxvUZ0N8p1k8DRHv-sGMUwT0SmCuoww@mail.gmail.com>
Message-ID: <CAK7LNATLnRqLeisBOiWbxvUZ0N8p1k8DRHv-sGMUwT0SmCuoww@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "conor@kernel.org" <conor@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "krzk@kernel.org" <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 6:24=E2=80=AFAM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2024-06-28 at 11:13 +0900, Masahiro Yamada wrote:
> > There are two solutions, depending on what you want to achieve.
> >
> > The official way is to pass the absolute path to M=3D
> > (or relative path to ../linux-tdm-kvm-out)
> >
> > The other unofficial way is to pass VPATH.
> > The external module build does not officially support
> > the separate output directory, but you can still
> > do it in this case.
> >
> > [1] will work like before.
>
> The absolute path worked, but why not make it use the relative path by de=
fault
> in this case? "arch/x86/kvm/" shouldn't be confused with an absolute path=
...




If you give a relative path to the M=3D option,
it is relative to the top of the build tree,
not relative to the top of the source tree.


If you use the relative path correctly,
it is interchangeable with the absolute path.


It did not work as you expected because
you used it in the wrong way.




--=20
Best Regards
Masahiro Yamada

