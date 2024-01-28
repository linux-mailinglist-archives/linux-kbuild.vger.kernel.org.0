Return-Path: <linux-kbuild+bounces-702-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8583F623
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 16:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 640631F22CEA
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 15:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB32B22EE8;
	Sun, 28 Jan 2024 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbpC+pwz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6861324B41
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706456152; cv=none; b=QeyfYW4mVJifvhI5L22oGUEBxteHgnyyh75FR66T1vNAW46elu6LvEyKfNaJ3IVPUHlwKfEZJKWkwl/72xnpwi06FDdZnPQnAEbhrZFXiT/vX7XYT/fjZgqJsd3GQrqf9+nxA/JhS4/f2Jw4ZJ5EKywuCwvJxpqqxQPtvVxmu3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706456152; c=relaxed/simple;
	bh=dn195hq7gIS7IyC4YHKXquwV3jy5fOKgIpoYn+s6zuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=af72nEQsqhnN8YwYSDGgE2xwinqPjLJj9CaMETYRztCu6cHhBMxqvzFwkzkdMTPyK/d18VcT/zBWVWyJg9ldYBwbvRhT9SbuIXZ/2DbDaUj7FPuQaBvQOXhwPm6N2cFB01o4kLHLpAopT6g+aBb0Y5hudNKjwmm2Llb/7CIwi4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbpC+pwz; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so2672080276.0
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706456150; x=1707060950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn195hq7gIS7IyC4YHKXquwV3jy5fOKgIpoYn+s6zuU=;
        b=UbpC+pwzs77kuydijzI3fsP9+Tg3RazSyXLMQhLZsxH/opxZLqhQc53MMrCKkfnJ+W
         Kms7eHYdGdVOyYC8iJRLaGnlGB852Fp55x3pjyfT6SmEqz7VE9tCCQM6sRPBt3DXyyWm
         c9f/S6iUYdVf9PyuoScNlqHhdRsFALnNFvKVjYCLWVqnMo3q9Xx2IVNUgLoqY7cracrW
         0anj/1I1dDWh6n208ucRPb32QUVPos29GncmccYp2DUrfIUC9RYDMeWGPG4lQo2sqn1B
         qRx4NqNWM3rT5yIAeGjlJDeeUxUrZ3TzkjVY2lsdej9Y6cPZqtZCSfzSVQMp58R059qt
         QdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706456150; x=1707060950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dn195hq7gIS7IyC4YHKXquwV3jy5fOKgIpoYn+s6zuU=;
        b=mYN2x0XTOllZ/5XBlgxSPsfDALwq4q0W0QySwdwoiHXXuDQNJp3cwQU8scclRGoEbf
         jF/sshNAjngYzW0/OOo2praXWzxQu/y+Hf1depFMhIQGYPinb24P++mHw3xImrUVRiM1
         gwihv4O6aKVtmWi8+SyNdIlTs7kA5O5llttiv3GRjUzYpJPn2NmfTtEBZ49XMrmeEzwn
         RIFttvHdxhkhl+S1T4z99CL9N+FVO5czI6h/ksC16dxE0YmvRwP7oHGumNmURDwzwPaX
         xqYpmMlu2HrP8wH+enJ9FJ44c7x9k449EEBzHrovjrrAEjbhhmMlecneCLY/rv0tkmt3
         +Isg==
X-Gm-Message-State: AOJu0YyUHApX3e4e0lLpBTiF6Re6dkPIuAWdrTlw1mCQzcGhi4DFit1H
	wwIbkfMCV1BImQmTlCDb4G1Q7tootCxY42oSv4jzo85JObPuiv3EgGLyt7f2xZ4bgCEwWhfbIDL
	3xkRc9xdIVf8gFp3RuBy64MFNd+g=
X-Google-Smtp-Source: AGHT+IGqU9XyZjwxgJK9nrZCWq8xIMX0HxHjyjiwySG8D1aEH/8g8HW1j3cfR00JtJWeFIW5D4dMUZ9auOvwq+E7GP8=
X-Received: by 2002:a5b:352:0:b0:dc6:cf1:deea with SMTP id q18-20020a5b0352000000b00dc60cf1deeamr2573933ybp.3.1706456150181;
 Sun, 28 Jan 2024 07:35:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG+Z0CsTWFxi74PKpCkPjM_-60PsvqS7gkZKs5yrsA8OqL6Hyg@mail.gmail.com>
 <CANiq72k+jEb2kc_LN48959k0u5v5m1qGiJR9tmuUyvUweuXGeQ@mail.gmail.com>
In-Reply-To: <CANiq72k+jEb2kc_LN48959k0u5v5m1qGiJR9tmuUyvUweuXGeQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jan 2024 16:35:39 +0100
Message-ID: <CANiq72mZjMSWh-eTm1jYrmKuoQpQYCH3Zsr1noLpLb=nxcHVXg@mail.gmail.com>
Subject: Re: [v2] kbuild: Replace tabs with spaces when followed by conditionals.
To: Dmitry Goncharov <dgoncharov@users.sf.net>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Martin Dorey <Martin.Dorey@hitachivantara.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 4:29=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> My v1 still applies with the same conditions if the contents didn't chang=
e.

"My v1 tag", I meant, sorry.

Cheers,
Miguel

