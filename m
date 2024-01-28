Return-Path: <linux-kbuild+bounces-701-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A2983F61F
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 16:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECB5D1F22E2C
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 15:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AAF23769;
	Sun, 28 Jan 2024 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGB2Ue26"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350AF2377B
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706455787; cv=none; b=iiPoNSf4wnvQyqye4GRsl27QOpwh9YQe0kWCaV//69+HNboE8hGcUV7pkbB/mrGyk2NrlDXYHGXIZPbkvH3KWLrcv6qiV9wbs3BfZz8zmWEW/venTgF5d+M11g1RRAQF2SFmUNqWoVerlH2zo2OA8A2oAFN/0sXrcDQKoAA0bLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706455787; c=relaxed/simple;
	bh=c5MlW7t7lcB0prmumg/SaDov8nOMmokd9sv1Ph7F8f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4tNdbG8Zlk3o+Gl6RRVh8WlvomZg4P6at6bF9SLfW+hK6xbfdqaezU/H3/cIKd+oelYDDLa/HIWRufhdOiUhaNHvkiAuZRBLjsw4/L5PDzK/9Q3WPzPDaDCG9D0DfEnCRVZkyjNHPHI/5faNSd/A3+3n6gCMWB7Yc3dEfO/x1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGB2Ue26; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5ffee6e8770so23743407b3.0
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 07:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706455785; x=1707060585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5MlW7t7lcB0prmumg/SaDov8nOMmokd9sv1Ph7F8f8=;
        b=PGB2Ue26rsWhNmQZzNw4G//+Y3mvxY26nGrPX3ys4y/o97iV0xQzoi9QqInaJHxHZn
         N15SnAs7RIsbJ1slgzGmBrqil6lwmrH0JQXRKJyDcDAuFPTSgdidvZFDUNSccy4b+DHJ
         2RyuADPvXP7p/9xuB8lqNx0BRgT/YVWq5n3DvX4Xg79VP6IiBfoJZeSQgjVQVDOXGPRE
         rV25IS+lwZuOQ/UGQFMtD3Fc1IAUrhUN92fQspZXMTOd4STbyj+qVTtYfQ/iNEbPVkO4
         kefSl7Gn9fYVIJtWcFLsSXGuh8IqJkRFIGtpCIwYt73yjLFvhX0gXA5its9STybsqas0
         K+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706455785; x=1707060585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5MlW7t7lcB0prmumg/SaDov8nOMmokd9sv1Ph7F8f8=;
        b=Rsc4NiSYDSTB4ypaqLNxFgfG8I0rnXWE2/BmuvbRhPLCrC4eI2YCQUG5a0b3/bEEDr
         LYJA5esWfMpau/0jcu4CH7aYwQjEaWYTc3TXskA/VdSiqyrS6myy+yCUzmEg/OahAQLt
         xMnWY/gvpHeS8bMJmzS9IfDabqUFf8cwxj+tGTJR7fCfI9Taq4L2ZZOE6r2z9K4clV8H
         AizqKjQKAs4BzBinPSL8kKBlac7hc/8+4JYctoBvrBIVdKDnreL+5tzBz/Oj+EpOGR2v
         Opo3LvLDkFsVJifED+qQ7XhnZ3/dKVqM5h/x7RRIRLsA9o1Shze+Wlbnh1wuRIs5xIZV
         Z+bA==
X-Gm-Message-State: AOJu0Yy6QlqRrK3x2dJcJVnk4dUo/qWiKadWP5BK8tp+ZcwZC60Hm58n
	CAtBEl0N5hRDIVJWFuen8VzpUj4s10Bwz2xOTSjnRNfFb+rTxbApj/aDa5L5CCjV4Kj7CMUQQi+
	IOUU4je0yTtWjMCY2Mz3gu//HQUA=
X-Google-Smtp-Source: AGHT+IFp9pkrboLLFGpasDZx/n5LdsVyg6OtsBhaXuqdhc++AxA9TXmT/i+Fcj+NXkmkKd07fQtnwir83EWxsVyW5z4=
X-Received: by 2002:a0d:d710:0:b0:5f7:f3dc:b050 with SMTP id
 z16-20020a0dd710000000b005f7f3dcb050mr3175966ywd.66.1706455785098; Sun, 28
 Jan 2024 07:29:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG+Z0CsTWFxi74PKpCkPjM_-60PsvqS7gkZKs5yrsA8OqL6Hyg@mail.gmail.com>
In-Reply-To: <CAG+Z0CsTWFxi74PKpCkPjM_-60PsvqS7gkZKs5yrsA8OqL6Hyg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jan 2024 16:29:33 +0100
Message-ID: <CANiq72k+jEb2kc_LN48959k0u5v5m1qGiJR9tmuUyvUweuXGeQ@mail.gmail.com>
Subject: Re: [v2] kbuild: Replace tabs with spaces when followed by conditionals.
To: Dmitry Goncharov <dgoncharov@users.sf.net>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Martin Dorey <Martin.Dorey@hitachivantara.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 4:10=E2=80=AFPM Dmitry Goncharov
<dgoncharov@users.sf.net> wrote:
>
> Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>

My v1 still applies with the same conditions if the contents didn't change.

Thanks!

Cheers,
Miguel

