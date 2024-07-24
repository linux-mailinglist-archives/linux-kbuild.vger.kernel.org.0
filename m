Return-Path: <linux-kbuild+bounces-2638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9349093AE60
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 11:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52BA02815F7
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 09:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F11A2C1A5;
	Wed, 24 Jul 2024 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9Ivf2Y7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F516BFD2
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721812293; cv=none; b=c8zRTAt6IF2PhXrH9sErSU0Uiy5MhkBLoSV8kKPh1MjV4vkZcYh7HQr6CNIIujG9iLIOKfMupBCSES9c+5pfqsAsZkEtC70pwNsupO9jRu7469y3nGxrYqcGSa0RyIMYCmtM67KCNFZiAqBT3eiHZ/06K+B7RAGEZGI3JVi02IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721812293; c=relaxed/simple;
	bh=i1zC3pS7ZTsRW0c8eD6vNiWXsGKFiGFe0NKC1nCKg2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKoH0itKyeNrplo6xaUBwrwFvotQIHoXUlJP8eYRxN3kzxkLYCMqEeMBUQeiiDa5/gZWX0BKOzmR4rOle6P4OGO6f/QZNa0zs827MwTFboQWXwB3M45hnAmV6s9uzQ1u6bqghQhw7EtYp7tsTY3zMqC5C/De1HrBWzQpHlQIw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9Ivf2Y7; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2cd34c8c588so2055836a91.0
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721812291; x=1722417091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1zC3pS7ZTsRW0c8eD6vNiWXsGKFiGFe0NKC1nCKg2U=;
        b=L9Ivf2Y7sPL7ygXU7mESTsuAIbxzwfq3El7bJD8nqMkivmIYwfXrzeRUQ2WOpdZEyz
         n+xwAhSYjvkej62T15lyurClIfkY2GEYlTkiR4Wwv22900Dpvs2TS2+AiSLnVs8FfEzW
         M2jElE/m7A7muSoT0QXwPrxBM5/ougbm3uM+TC8UcE5BEBJzHssvtgTsdMELjNzouRKW
         kmtjyGHX6+JZ1TK4/olIKEnBBZoB1jnsv+aRciipXyfD1hgcV9p9ADqTT7/2fc4CfxKr
         cOZdY76YH9uZMQo0/UJxmoUN64TJjI8B+kkqJ4FOaM/coEqCtsBjvQ8ypBPjyJb+NKza
         ATWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721812291; x=1722417091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1zC3pS7ZTsRW0c8eD6vNiWXsGKFiGFe0NKC1nCKg2U=;
        b=TBGKHshk23wRd2vmcRS78JQCDX7+l9Zdh5y3SsCRBVXDaO4RoOGcPsgQVrB0oXaE+M
         fTmoesuqAoW22zuQyVMLev76XWf01tLl/tt5h4TlbegodmMYjI7w1kXtBjdt6HrwyR3b
         X2JOdOU0uZQp98B4a/BU8dCg0CSr1dWZQEPiZbvup6+vxreVZFDZqg2Uh2RkPCTRqPwI
         /IBiwcqGR7QSstkYgRPfHBnOFQj8rbxOfX5VjpLYS9oPlfBnty6XZg9jYLmiyzUxkD0B
         m91olJnA730rUp/et2cUhrWPyg3HvTEP+Dq4HrGAOUTkQvTTZPO4UIha2f6tzRHDjmPS
         +VEQ==
X-Gm-Message-State: AOJu0YxDdArTgFFE/JGC3SLhJBJGrihAFoKmCXSCv25UA3cLzCzyFjfw
	kohwTMymWuiuPP40T7Y9oQJmKMzukjQLxpa16HW7wdJW2YUXP2Uot1cTaxlYOmOwm+f3/2A3RvM
	uZpS0pDTxSYNu45fWYxXztAnuNnGzRDnq
X-Google-Smtp-Source: AGHT+IGqXpKFL51U90TPT3EA6YvDwHml3vkSbZ6vW6Dw2yKmdrA5yJ+f4GMRDieh0bteBkNDih2JMxcTqx2U6kqpU+s=
X-Received: by 2002:a17:90a:d804:b0:2c9:5c67:dd9e with SMTP id
 98e67ed59e1d1-2cd27432530mr8017851a91.19.1721812291521; Wed, 24 Jul 2024
 02:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724084655.930706-1-pvorel@suse.cz>
In-Reply-To: <20240724084655.930706-1-pvorel@suse.cz>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Jul 2024 11:11:19 +0200
Message-ID: <CANiq72mkjzFOXwbwVu9T4AgX=0L-cN9Nxn5ttyw2Cp5X2tS_Kg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: Fix C locale setup
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Rafael Aquini <aquini@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 10:51=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> semicolon separation in LC_ALL is wrong. Either variable needs to be
> exported before as a separate commit or set as part of the commit in the
> beginning. Used second variant.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Probably a typo after having removed `export`, or perhaps it was
assuming a built-in `date` for some reason.

Cheers,
Miguel

