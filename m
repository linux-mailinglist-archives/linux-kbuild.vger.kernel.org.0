Return-Path: <linux-kbuild+bounces-4277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965D9AD131
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 584C41C22469
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA4F1CACF8;
	Wed, 23 Oct 2024 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJ9OXg6t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0517613B792;
	Wed, 23 Oct 2024 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701604; cv=none; b=WmoyuzzhsG+IpOubn2BvT7ZkTPWMi8idX5FG0RmwwbnY77Ot17w1qFVLgqJEMJcQHzNwFGqqmPWm5vO3Lv+K7tdzESpOiGxsUbTRdea69ERDfP2f927fQ3u/DR39y5K7GwRIfextKx8+ReBHIVj8+jIE/Ymcv55NELavAOt1vng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701604; c=relaxed/simple;
	bh=SM+PhxcCD78xzMljAIGesz5757/4P4r5jOX096fIats=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2MOWFZ6mg0bWx3ZzT14tlW2TFZAmoqlqzppKQVjjmqoiSCLylI414yk+lflp8No8k4Qzpvp+UcXonPLk4KUE86j99HqPnIjdd8kxSqEU2uvfEedQQ5rBOHCS0Pb8K8cdP6UFOot9k6bonI07Vpb9h48pObDaOTb+k1gsshP5H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJ9OXg6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BF4C4CECD;
	Wed, 23 Oct 2024 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701603;
	bh=SM+PhxcCD78xzMljAIGesz5757/4P4r5jOX096fIats=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qJ9OXg6tr2UN8G8NJSKZ61b/INjSyKmWqbZxBl5LKfNKOXCZ7Vm9FF7ZT7dZ44m4J
	 HTdpCKbSid1aIg3xJ1mj2xG1KkcgsUbSMzvGG0rV8MULbHk5aSdLkaMHUwiu57aglV
	 tUJdkYEGcYHRa9mjN2nG7FkzSVJsUgAlSCj7yjqUXPUl0Hnj/6OSEHiMrNlmZCPkyD
	 NM6KhiEaYBtYIi+QYPgjVqGmyzn0Nfdfqq/mP1KDuDVPaDGO5jMTo2TQa2y7q4q7/I
	 z8oSxQ5ibZvHb1B6RviJ8mAVla/imGNywGP6MxkAKooIdIgXL+6W1eRMrpPBwgj5qq
	 JBEjG5ZjEWZhg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e6c754bdso6877093e87.2;
        Wed, 23 Oct 2024 09:40:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg2lhy6EmJBz5VacCR/hHpm05Bkf11a8onh0+oPvpmh5Et3XmCpbvMvM4XGzgEtiD7Lrxy2KDQ5j3rspU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ma42NI8baaVr4AYehBCyfaYcBFo+OMn0n69+/XLAvBfKpwBz
	TE2ya3q+7YaKKdHYOGEhsZTJihGMp1GZXj4xS0v+e58btWsWS1JU/6tXMwWgs4j9KdcrwRBN/jx
	r67BhTe7a1t30ZNn3FYI5ZXzpzKY=
X-Google-Smtp-Source: AGHT+IE4JDkG3iBTL2QAGPNMWtY0jVkQ3fXLUbUBzPl9zUt3gwuCH1uoxmcJTfBaUS5Gh/fI7Jrz4vjXRIoLEUxOdDA=
X-Received: by 2002:a05:6512:15a9:b0:539:d9e2:9d15 with SMTP id
 2adb3069b0e04-53b1a3441c4mr1745819e87.29.1729701602194; Wed, 23 Oct 2024
 09:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <8441512.T7Z3S40VBb@devpool47.emlix.com>
In-Reply-To: <8441512.T7Z3S40VBb@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 01:39:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNASdLT-KQA7+Vn+Y2ZJeropcR-sjmv8p2=DCgzCyQdJAEw@mail.gmail.com>
Message-ID: <CAK7LNASdLT-KQA7+Vn+Y2ZJeropcR-sjmv8p2=DCgzCyQdJAEw@mail.gmail.com>
Subject: Re: [PATCH 4/7] kconfig: qconf: use QCommandLineParser
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 3:33=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> This has a much nicer output without manual processing. It also adds wind=
ow
> management options from Qt for free.
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---

The help message looks as follows:


$ ./scripts/kconfig/qconf --help
QSocketNotifier: Can only be used with threads started with QThread
Usage: ./scripts/kconfig/qconf [options] Kconfig

Options:
  -s          silent
  -h, --help  Displays help on commandline options.
  --help-all  Displays help including Qt specific options.

Arguments:
  file        config file to open



I want to see something better for the explanation of '-s'
and I want 'file' and 'Kconfig' to match.



>  int main(int ac, char** av)
>  {
>         ConfigMainWindow* v;
> -       const char *name;
> +       configApp =3D new QApplication(ac, av);
> +       QCommandLineParser cmdline;

Please rename 'cmdline' to 'parser' because this is
used in the code example.

https://doc.qt.io/qt-6/qcommandlineparser.html#details



> +       QCommandLineOption silent("s", "silent");

How about  this ?

silent("s", "Print this message and exit.");

The description is consistent with
"./scripts/kconfig/conf --help".



> +       cmdline.addOption(silent);
> +       cmdline.addHelpOption();
> +       cmdline.addPositionalArgument("file", "config file to open", "Kco=
nfig");

I think the third parameter is unneeded.
Then, the help message will look better.




--
Best Regards
Masahiro Yamada

