Return-Path: <linux-kbuild+bounces-3819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1D4988A77
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2024 20:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A6E31C22F5A
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2024 18:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E8B1C2325;
	Fri, 27 Sep 2024 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=m3y3r.de header.i=@m3y3r.de header.b="M+4Wid5+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from www17.your-server.de (www17.your-server.de [213.133.104.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EED518872D
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2024 18:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463220; cv=none; b=UUGY9sVOGFjymrB3tjIQhNgYoCAHsoImGXWr2IRYANkitHPhqC8+mzLgM3C9Ssx8DRNOlP34S4Mko85W2nOqwjwavQE+zhsnjn8Xy8c80x5+Fm3mge0mtBWKSyuuFIteOegtGeJ9JL2xSnLsF+72BlqVd8Dn6or3/Nhc+yfbjqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463220; c=relaxed/simple;
	bh=U7emJ0K7vBdwKckW0zMyDHn6W+PxcfNaks0/ouOaR3A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cag5JbTvMWr7WeLaitlFxyJoIuQzgvtI2no2aiy1FRDFMYUMc24l6i7WcElWdICkKfKG/AUyxvhNpAEVDCt01O7ofG8j6YmUtP0/UOVHR4wycPQk+YA7ktxEFLHSxijZX6tCDlk5yLDAiFD+J2qPuoFE3EK3GVChUKocqHSo4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m3y3r.de; spf=pass smtp.mailfrom=m3y3r.de; dkim=pass (2048-bit key) header.d=m3y3r.de header.i=@m3y3r.de header.b=M+4Wid5+; arc=none smtp.client-ip=213.133.104.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m3y3r.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m3y3r.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=m3y3r.de;
	s=default2402; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=U7emJ0K7vBdwKckW0zMyDHn6W+PxcfNaks0/ouOaR3A=; b=M+4Wid5+iKCcae3kegRkdlZ5xP
	D9rP23EldJjO2/KrYcthKw4Qd6Y90sUFa6N1S3+G9to18ycsSyLu7+rqzeqD0Xw0TTIs1jYH9Z/Sw
	lpJ9Ec/QMb6rdR43I/8TdRXlilFo1hKl6v+uhQW8T7cyG3MobNPKZvaq2rYQkKJ/7bLvdd/SQ9uj1
	UR13/V5Bal53Dmmjws0RxivoDaoJYEwikcpXS46Ng/JwrmpniRGb42nZ+3lv4+RhZXPaUNommg1O5
	Xy7mnp5zllvwnoD79thmxuIhgs5FG83fxYHBrPUDefVpU0cI/a8WQy6vz+fujN7lkREUFZcCRna0a
	a6aSCE6Q==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www17.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <thomas@m3y3r.de>)
	id 1suG5o-000Gnl-17;
	Fri, 27 Sep 2024 20:53:28 +0200
Received: from [2a00:6020:509f:6000:1bb7:409c:ce4:4e01] (helo=[IPv6:::1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <thomas@m3y3r.de>)
	id 1suG5n-0001Cj-2H;
	Fri, 27 Sep 2024 20:53:28 +0200
Date: Fri, 27 Sep 2024 20:53:28 +0200
From: Thomas Meyer <thomas@m3y3r.de>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: use memcmp instead of deprecated bcmp
User-Agent: K-9 Mail for Android
In-Reply-To: <CAK7LNASX-BDHeTeuEnQwJct5wcqmMGbBQo1EeughfKe83pYZ7w@mail.gmail.com>
References: <rxsikukdh39.fsf@localhost.mail-host-address-is-not-set> <CANiq72nwcAAC8eGCzHZ_sOwccCqbg3KD6CraXj2r+hDwhYqqig@mail.gmail.com> <CAK7LNASX-BDHeTeuEnQwJct5wcqmMGbBQo1EeughfKe83pYZ7w@mail.gmail.com>
Message-ID: <F2FD0DED-84DD-4E30-809A-7BFE5FE1A769@m3y3r.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: thomas@m3y3r.de
X-Virus-Scanned: Clear (ClamAV 1.0.5/27410/Thu Sep 26 11:30:46 2024)



Am 26=2E September 2024 17:33:20 MESZ schrieb Masahiro Yamada <masahiroy@k=
ernel=2Eorg>:
>On Wed, Sep 25, 2024 at 5:50=E2=80=AFAM Miguel Ojeda
><miguel=2Eojeda=2Esandonis@gmail=2Ecom> wrote:
>>
>> On Tue, Sep 24, 2024 at 9:26=E2=80=AFPM Thomas Meyer <thomas@m3y3r=2Ede=
> wrote:
>> >
>> > Make build succeed on systems whose c library doesn't provided the de=
precated bcmp function=2E
>>
>> It would be good to mention which systems are those=2E Other than that,
>> it looks good to me:
>>
>> Reviewed-by: Miguel Ojeda <ojeda@kernel=2Eorg>
>>
>> Cheers,
>> Miguel
>
>
>Agree=2E
>
>If there is a known system that does not provide bcmp,
>that information is appreciated=2E

This fix is needed when I try to build Linux kernel on my Android phone un=
der Termux with bionic libc, which only seems to implement memcmp=2E

>
>It might be useful to add a link that mentions that this function is LEGA=
CY=2E
>
>https://pubs=2Eopengroup=2Eorg/onlinepubs/007904875/functions/bcmp=2Ehtml
>
>

--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E

