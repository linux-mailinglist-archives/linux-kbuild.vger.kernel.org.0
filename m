Return-Path: <linux-kbuild+bounces-4274-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D279AD120
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0811C21D91
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC591CBE8F;
	Wed, 23 Oct 2024 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMkvvvV9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF21CB530;
	Wed, 23 Oct 2024 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701491; cv=none; b=oPqszjfTl5zz1Jbk6R+hcrO4B+0GkA1uvkJoUCGB3MXdDUFnGp+oF1b3Jx29p41ue2DlGvP7evrAL7zbR+FzQh/rEATlpfzThXLzyFxkHhC3aRqrF+V17ZmMAPckWe4cws1Mver2Wu4xS8wggyL6Yr9YkJSBfbTnK0fb+zd7n3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701491; c=relaxed/simple;
	bh=BNo7BzhX3YylO9KFxde/uOGQx+GVlYCg2OgyYnPzYs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/uHHBQazArtErUxAKHoXLZEJ7L75oN/Ga7jCKUTtEFz/NELBTMJpUsAEmC9SRuelMJdqq5IIrQRpuTXPUYQfnocY+Z5aHIka0uDi7ZiOz/lTxm0K3cF13fw6URAmrEWK87E9ufxbJfxwODQ5BUhPgwapNLz2qHiCLXLH+mcE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMkvvvV9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E67C4CECD;
	Wed, 23 Oct 2024 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701490;
	bh=BNo7BzhX3YylO9KFxde/uOGQx+GVlYCg2OgyYnPzYs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DMkvvvV91rv2JQ3k8ew9bLLehQKlgyBqsKgQ5OOxOteJis2hPx4RVuH1UFhgTzXj7
	 m+O+lB1F3wIN0Jk8+Xya+OUQ9EUH5wGb4Og+Byt/N6aVZofZ1fy3G7CvU/csoR0IQs
	 ZGJykJsN6uLoeOEqy2E0naWYjfrHf/FCjXlXR1U2dFBeNPEvlIzE9oUAqJkiFH4cto
	 YZDMRMmV+9p/XG0f6cqWMsZcs7rCc/5ETb9qmo+93ezQ1RlgxjZHNuShytoFOo04zm
	 l9MAKFbCTcUnk5P/F0EdfEeNYZryJeQbgNq03uV5OMoBoLGtAaJnbeKceluYhLyQFn
	 p7mpxWEy4Whow==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e63c8678so8513459e87.0;
        Wed, 23 Oct 2024 09:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUF0gfmuQKMDZi5cg3bmw5ZvC21EosOB+vkGkXeuDWZd8HET3K4h2GsTrDnhABhFftfGMAgdZ2Eyg/nFkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Dn4qKKdTVfso6P8ALsALuK8uZCs3p5zrJKVLmIyq7naGHOgz
	CLIoXkqx6upvlkZVxxNC81oYmwoZAWci/hhegNXHbrqAuOzyRjmEh94M2JPvKNuMTYl6STUGLP6
	Jhz0ksObTNkQYtfW1X78RiYxWASk=
X-Google-Smtp-Source: AGHT+IG+R7LQ0nPzlr36HBRFAzK3wG7wecOrLjequ1uPE4a+5q1LyHrHu0AqmlSYEokEA931SCU/OxhvJ+xrIAywiTM=
X-Received: by 2002:a05:6512:692:b0:537:a855:7d6f with SMTP id
 2adb3069b0e04-53b1a345f2fmr1796522e87.34.1729701489340; Wed, 23 Oct 2024
 09:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <4931941.GXAFRqVoOG@devpool47.emlix.com>
In-Reply-To: <4931941.GXAFRqVoOG@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 01:37:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdRdzbwciav5ewA2P9X=r6CeMb55zRny5QWCe62gR73w@mail.gmail.com>
Message-ID: <CAK7LNAQdRdzbwciav5ewA2P9X=r6CeMb55zRny5QWCe62gR73w@mail.gmail.com>
Subject: Re: [PATCH 1/7] kconfig: qconf: use QByteArray API instead of
 manually constructing a string
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 3:29=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> Using a naked char[] here isn't necessary as QByteArray has a nice API fo=
r all
> of this. Calling constData() will also always return a 0-terminated strin=
g so no
> further handling is required. And then the whole manual memory handling c=
an go
> away as QByteArray will care for this when it goes out of scope.
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---

I do not need this patch because I can refactor this function even deeper.

I have locally kept several clean-up patches, but I have not got around to
submitting them.

I will send some of them later.



--=20
Best Regards
Masahiro Yamada

