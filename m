Return-Path: <linux-kbuild+bounces-2006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 260118FD46B
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 19:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B43D1B242B4
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 17:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BE113A3E2;
	Wed,  5 Jun 2024 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIKZSRF8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE78D25777
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610168; cv=none; b=jfSyJTBjbhnMK61P1HIP2QNEsLe3BuSYliwZdjTBDYTi1VgPIkiJGMK+TyrI109AoR/0OWj/6So3uSLIKAPeNYjLgv3eBQctwte5jfe2567cKkLHEULI0LH5UoEhcnCMzrOLXqDkDNzZpnWWe/JgHtfY7cwXuGwoVEtXwnYdlA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610168; c=relaxed/simple;
	bh=2yRQye9beroRdBKTQYyYdfcuLqOxcnUW0nX79MdEyJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krq7yFruFcSn6UU3El9mvoJLfydvicwSDQbyGwHzF0UiHnYsVZFuMKJJhCzLCZMCLihk5A3YsfHc5ROUye2VG30d8GUYWzrJlEbcntGduqE9R/i/X16a6woRw8itIdVMTQ6UA05uHgyOt0v1a5YLKAYbZyMhY24UexARyy8toKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIKZSRF8; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-43fdb797ee2so132041cf.3
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Jun 2024 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717610166; x=1718214966; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPi319zZVoQwZLomnMCez4cxKHIu9P25RMkzJQpk6iY=;
        b=WIKZSRF8/6yw/CZY43vwmZiINigCeiqGL42X+RosKZthgtaFoDV0kWRU1tBFQebEm4
         YzHeBMSS9tfSIZIzQAH1B9/0e4mU4BDbK9Bn5gOQzjF6bmpoCJaUwyFZWZhlYVfOdEOh
         fDE10ISof+KG120D2qIplOzJZvrKLU6IKXVs0U+j7fuXlDkYDODAsxBIF4puBr1v8n4N
         tm+5MNzK2uSQLYBuDYKOwo//e/60WWMUV21dziOO+KRR+V6SliePzxoZWeakGNTKCmIv
         21Q+A/qFwlLWRF840vpjxZ6WOhiM9pgg38bxTCmL+lH6brIJBTGaoK1hCANycCAepNZ1
         CnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610166; x=1718214966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPi319zZVoQwZLomnMCez4cxKHIu9P25RMkzJQpk6iY=;
        b=KheyMPVVl120xf9kvW0MuRsowe1IFgQW7arTQb62vYsGmethCNc5q24FOnE2h2zJQK
         X5IsrPdMPNQ2/rE9knZSBza/NDWNSZSG1CgxQpjK99KQjA/6CIbvysYIbZQmhog3xbTw
         kkGfs9Y1YSC869LmYDHQxDPLedLIITcXb7WFX7fiUmmKBxmXytAtMmIcvM3NVZF6bhMK
         eZjJRbQKO4IopLhUN0MntMsCpjn9/n/FYhujZsCO9E5j7LjH+RPIprJ6yPo3Ub3LBJeD
         gqVUgVu9Lp8bWM0Pg2VP+VP96mhndK+mK0+dwcqICTEDP6WCjc/IDKLs8gwTCoV8H2pA
         gZeA==
X-Forwarded-Encrypted: i=1; AJvYcCWctgUUyjXeZM/men234Vf+9XMboz8nv6CXUavSIZ3z2jp7etB/rsxn9Qi6s1DdtsCY3HDW4QLXibBLsLyA8/DyO+/S+dutgC6njN4b
X-Gm-Message-State: AOJu0Yw/PHpZfVhqgbp8/+e6EOYda83HxefIDv8UWAwg+zQSmZyaeCpd
	1jevy5f3gnRGKTf42ug1TKl7r5LxGsdmXFXO3UoDuRNPMkUR+BbyZ2guyiGq
X-Google-Smtp-Source: AGHT+IE/VwTBzGhkdcti7XhwDMcgnsiKCVHhXTPZx7wvhmQC8EFjrVOotzru5pvI2FF8OpzW4UYtPA==
X-Received: by 2002:ac8:5d4e:0:b0:43a:f4ce:121b with SMTP id d75a77b69052e-4402b650bc2mr41602591cf.41.1717610165659;
        Wed, 05 Jun 2024 10:56:05 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff23e269bsm61960931cf.46.2024.06.05.10.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 10:56:05 -0700 (PDT)
Date: Wed, 5 Jun 2024 13:56:03 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH -next] kbuild: explicitly run mksysmap as sed script from
 link-vmlinux.sh
Message-ID: <ZmCms_P93NR-jivC@radian>
References: <20240605034903.373617-2-mailingradian@gmail.com>
 <CAK7LNASjUesga5pwtaV9aRd_MG7infjistFTsSWbvMpytggaEg@mail.gmail.com>
 <lvr3d2maqln56lxzqvubj6jfeadjjgvro74x5m7pyb56rhgeus@dt64aothn6ch>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lvr3d2maqln56lxzqvubj6jfeadjjgvro74x5m7pyb56rhgeus@dt64aothn6ch>

On Wed, Jun 05, 2024 at 09:07:26AM -0400, Kent Overstreet wrote:
> On Wed, Jun 05, 2024 at 10:05:22PM +0900, Masahiro Yamada wrote:
> > On Wed, Jun 5, 2024 at 12:49 PM Richard Acayan <mailingradian@gmail.com> wrote:
> > >
> > > In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
> > > script"), the mksysmap script was transformed into a sed script,
> > > made directly executable with "#!/bin/sed -f". Apparently, the path to
> > > sed is different on NixOS, fixed by using the env command.
> > >
> > > To accommodate the number of arguments above the normal maximum for
> > > hashbangs, the -S flag of env was used (as in
> > > "#!/usr/bin/env -S sed -f"). However, env -S is a GNU extension.
> > > Explicitly use sed instead of relying on the executable shebang to keep
> > > compatibility with build environments using Busybox.
> > 
> > 
> > I am fine with the code.
> > 
> > Kent will drop his local commit, so please reword the commit description
> > without 973eca8db557 in mind.
> 
> Sorry for the hassle - glad this is fixed

All good :). I'm just happy that the maintainers are still listening to
developers compiling linux-next on Alpine Linux.

You can optionally attach a reporter tag in v2 since you reported the
original bug.

