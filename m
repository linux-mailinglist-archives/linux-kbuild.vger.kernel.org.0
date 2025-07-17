Return-Path: <linux-kbuild+bounces-8041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F2DB08E4F
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jul 2025 15:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2A91C24512
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jul 2025 13:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E432EA482;
	Thu, 17 Jul 2025 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="qUywYP61"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E692E975D;
	Thu, 17 Jul 2025 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752759119; cv=none; b=erpZtzJ6a5lBGTlma6vKseS7llNmcvE37HQTxE/VM98Hn/MkkH39f8QX8BYAJVQulzJQ2X8fR3C8yOCQ8TQfbrU+eu9QVq4M1ASLBoXoZUBPVj9Ym7USR0XrWN1011C7j5s5IGwy3gy93z0xfBkXD60YBGRj0vb7c9cSFjW8Yxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752759119; c=relaxed/simple;
	bh=aPEWDW3DKbruNkNr+5qftKrpi1xMqYprC+1aHTuSLYw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/9MYODNERRUmO9TmeRt3Sri/jJwcVuFuta7/pNjFjyz13gyAkYSQZv6y+fzqAnsLS3dVy2V5NB8ZDtNiUM0u4K0386GV+eq16/qlwZ7fwPz7s7H6x/4LwPL4pmEunGWvyJMPuSToAzkNtx4jfhga/24CUGiTJvuhUYAxa5YhPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=qUywYP61; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1752759105; x=1753018305;
	bh=aPEWDW3DKbruNkNr+5qftKrpi1xMqYprC+1aHTuSLYw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qUywYP613MdGorQ6Skw0P4OHml0OlX7xMq8/HtjRKCM0b4AnphpKQ8UQj05AVyOKq
	 Jvo/77m/3rzY9zTxNRdadHYf9XjSJ29YEs/9JfkAAl6QOpnDiwU01b8vKud06URERr
	 z6DV53QMPqWQSKKHKwiJsuahKpuCzzCcVXnqkoZDi+POZzOdrkPMoYbfadJM15V2Kt
	 8HsLFlM2KSqTviUwbfNyCUm9iFC1OhvF0oNimT4jLkCZZX2jI+834P4C6fi2ienf6d
	 UE4cObV7oUVTBMGyLXdU6HOJ+KLLzKoH85QIQqF1NsDxbsWnwuGzClUkChQdgqHcZf
	 4xQy/wPq/eiHg==
Date: Thu, 17 Jul 2025 13:31:40 +0000
To: Andy Shevchenko <andy.shevchenko@gmail.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Luca Weiss <luca@lucaweiss.eu>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: Add Qualcomm Sensor Manager driver
Message-ID: <pf5Z61lF8AhA7lEZ3mew6aSShDnuQUe_da_gGIcw6cftOM0kuxDYHrnIbiOA91kHYw2RCQP4MvqOkubyJisqu8MmfcFI8yB5bXagfEO-U_Y=@protonmail.com>
In-Reply-To: <CAHp75Vf8NzYRMeM=+S4p9LGnOd4iXcdw93hBjd=Rn=LqBXgwgA@mail.gmail.com>
References: <20250710-qcom-smgr-v2-0-f6e198b7aa8e@protonmail.com> <20250710-qcom-smgr-v2-4-f6e198b7aa8e@protonmail.com> <CAHp75Vf8NzYRMeM=+S4p9LGnOd4iXcdw93hBjd=Rn=LqBXgwgA@mail.gmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: c4341d71dd1799d4c6fdd96eeabe45193f82ce56
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, July 10th, 2025 at 9:58 AM, Andy Shevchenko <andy.shevchenko@g=
mail.com> wrote:

> On Thu, Jul 10, 2025 at 11:06=E2=80=AFAM Yassine Oudjana via B4 Relay
> devnull+y.oudjana.protonmail.com@kernel.org wrote:
>=20
> > Add a driver for sensors exposed by the Qualcomm Sensor Manager service=
,
> > which is provided by SLPI or ADSP on Qualcomm SoCs. Supported sensors
> > include accelerometers, gyroscopes, pressure sensors, proximity sensors
> > and magnetometers.
>=20
>=20
> First of all it's almost 2kLoCs, it's on the edge of unreviewable
> code. Please, try to make 3+ patches out of this one.
> Second, take your time and check what your code is using from the
> kernel internal libraries and APIs and follow IWYU principle when
> including headers.

I can cleanly split it into 2 patches by putting the QMI components
in a separate patch. Not sure about 3+ patches but will try my best.
Will review includes.


