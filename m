Return-Path: <linux-kbuild+bounces-988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73685903E
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Feb 2024 16:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEC801C219A0
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Feb 2024 15:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B847C09F;
	Sat, 17 Feb 2024 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="DbaWaxEy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D12E2AD0E
	for <linux-kbuild@vger.kernel.org>; Sat, 17 Feb 2024 15:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708182155; cv=none; b=IsQNoK2RmC1V3Hd/lhbHeobruZv0QYqR25k9CAINZBVbUsFhHfPpUZ75rw8R42DO97FyemTVeLxKYUuqtI2mEY7AbzrAqb4KsPZdQL7OUsz33CGmAsvLldD8SBcBDrqFLZHxF1fYwk09iOt9cNplnjZ18UpVQJkLk/tSZXzn1dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708182155; c=relaxed/simple;
	bh=ILCeUUqi0K9sqscq3X9d3q8gBc3poPrNqIRw6KjseAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bp4DGDPnlepMgvbU3Po99W1F+ubuXDfHidwh6T7pWIAPEo2SpURMaCzYuUsifARdjPD5BdLonxYGoXvGUJgNO+rqz38q+96VURFKpR52yUvZI7LvSUlYnDnJOQVlxjW5GfOwJHVbb6P73jr6jxRDnya49cSY32HN8lf6b8HJEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=DbaWaxEy; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d0cdbd67f0so41973561fa.3
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Feb 2024 07:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1708182151; x=1708786951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILCeUUqi0K9sqscq3X9d3q8gBc3poPrNqIRw6KjseAA=;
        b=DbaWaxEykx5SWamSgjEVvxykzZOcw6ITzGZ8d9aLvXikhAW7iGiplMkiWqRqBAG4LG
         SfAb3ik5+3/g5av+O2ytLZjnxo/mngS7q0YSV6ivAuLjLH9s+ggUZqhJ3iAZHNZmJ8F8
         Ip1r0NkxAn2PXOzlNd0SWH3JUVPux1WRaSU8k3g2wa75KCrBmUPXq28F7QLyI2ON7yMv
         0vk9xUpPuvb51/v1Zt/+/jCbM7G2VdzQMM0n9BcTj7Gzz+1P0CRuG5r6LH1o2GMA3c9R
         25uyLToNLUh5o4Dx1ucGPwUSAzItphKf5W4Xyyi4aE7ecQU0/VYYE/fVuGnqoBAWpFjN
         qlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708182151; x=1708786951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILCeUUqi0K9sqscq3X9d3q8gBc3poPrNqIRw6KjseAA=;
        b=xQqtXF/2L0Aq3rCo6npCzMvBONmoe7GEcheQ+SnUp1An9yxa8xQUqyNVLDtb96Ln6m
         fnkhm4ZlzCEM5BQdQxfcCp+/xSs544guPtqqNyPPicAz9Z2YBbaJHO9KkU+hYBW8ZnpY
         n63hiQDVgQZ6qcf6t+3yhXiofLkQGJfRD6/4/vphvlRGcBiOxVD6V1qyE//raT8PCb1/
         9oI1/mxkVeCC3KdcwXG+XYc1bR8x39NYuiso3KpklMH5KGJzLufnOaqtXjQnsJYQUPYO
         G00Di5N+Yld8oibR83mtMw2GTQDcTeu6HgLa0XWXQ0LbLwgISOEB4qZXE59RtvKJGsr4
         xHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf5Q5tndzdq3qZ0t86DDhL4BAKd4cNcZxQezO8VzsZHUgjyFSKNOia3tdPpDXar4StJy5siFWnGDllSnBibDvNi4RkP55/RpNjzW7P
X-Gm-Message-State: AOJu0YzDBiIvxJKydlZ0PWqtW1sgWdbFqSQp7W4Ta5FIhp+LtU1udhI2
	lojXjF5s/SkyJ+lOVrvd9VG2SNEQR8iQJ/Hq6bd8FLFmQdioxw6JYIB7DlUBWLZVzHZZS4R9vBj
	+wjBMme4awZW4LVFd9fpG/UNapb2dF3mNTYwMqA==
X-Google-Smtp-Source: AGHT+IHIvT6p5SFDjLypooegrTTShaNlCq7WSa8iZzwV/mIUJGxt4t+vltDqbecDjgqMkCpNSHz69ELYR0ozXioW7I8=
X-Received: by 2002:a05:651c:2123:b0:2d2:2e8b:6eb5 with SMTP id
 a35-20020a05651c212300b002d22e8b6eb5mr825990ljq.40.1708182151371; Sat, 17 Feb
 2024 07:02:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215141321.899675-1-max.kellermann@ionos.com> <CAK7LNAT772pZEV09nEYTLOyU_og73zPkKjjL54e8yor-tnnHtw@mail.gmail.com>
In-Reply-To: <CAK7LNAT772pZEV09nEYTLOyU_og73zPkKjjL54e8yor-tnnHtw@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Sat, 17 Feb 2024 16:02:20 +0100
Message-ID: <CAKPOu+8OTqBzuX5vdg9FR2hSSpem26BugYc2h2QY9Bh5vSRuGA@mail.gmail.com>
Subject: Re: [PATCH] scripts/mod/modpost: fix null pointer dereference
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:24=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
> Can you describe the steps to reproduce it?

This crash occurred while I was testing an (unrelated) patch set with
"randconfig" in a loop. Unfortunately, I don't have that config
anymore, sorry.

