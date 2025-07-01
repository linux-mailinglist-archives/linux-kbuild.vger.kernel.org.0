Return-Path: <linux-kbuild+bounces-7819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E24AF014C
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 19:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03DB65270D0
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 17:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C303C27D77D;
	Tue,  1 Jul 2025 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QlzYJrh+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440281C3306
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389615; cv=none; b=Jb55sKvAE04xDPu+XVpb15kryCkgEnOh8aJ78dE2fmiyuDOx2Hp/Znq0F+ZugOVMtyo14qn5BItIwvz3J/+5BePaJip3xuu5fJl1FAMTF5cauxk+/5lAEg7+UBWViI1vMaJTny41OtZPgKnOat2+X6LS6DmerQjle6EC8E8fxk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389615; c=relaxed/simple;
	bh=WpjLH/E4cjfGcA5aVL0NX4+IgiTYP+bFhGzng+IGIMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUjhi2ne8lvcnMBF4YpDAwCrWTjUfTx1Nhq+i/aC+j9YLu6KP/D9SH5As/hnZENh1scaI9FS4UdpJ0Z90TXirTQ77+Mn7Qy9+TOZx+CeQeTpIpkk/CWmVu1addjsIedGFGTqyaQ13vkcdNUvOJtW58vNJ9gT5DTS5pW6k3pPoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QlzYJrh+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-237f18108d2so235725ad.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jul 2025 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751389613; x=1751994413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RuV+zYZlBXFCb4jtObBSN/YWaKNaSZemTX8LVanYMvQ=;
        b=QlzYJrh+fZUfghsUEeLpz/OaWHx8XzqL6Uzlv4+voMGqBx6tst4zId8luAvNhP/XVO
         RIf/2an7ZxyqFyCIwpArc/BzS/6m6wm6+BKO7kv/vID3OXcIJGAG1q7I3KLtTvfLrsXA
         +YKH+a1IrqdHHzPbfNwYBKJ9DgMeis+o+3621tQi+fjl/b26iAQVvlpYg5DVsBXOtLqL
         rkezz0drkUKU4Yd/pyp5T0b35TU4qS/BSdWdHFOknb5YdwyVddvb0Ffl82i5QULqXbE5
         HWn1TM4i77zZiQnCDOecj/z+yM7BuPoWxefI5++3Zn3ZCejWCtU1fAMp7LM8l5teAoJv
         7YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389613; x=1751994413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuV+zYZlBXFCb4jtObBSN/YWaKNaSZemTX8LVanYMvQ=;
        b=u01S8WJ6q5Zl+h12BIkk/Xzxe7ZX146GzZemiTE2cQTp/k3vq+Ts2xPLE3iIxJ7ldn
         bvckO0Lx/E8eBjQZSBT3ke0GDQratLdNNs5v3ENveeX0gqEoPtlHCyfNaogESBTBAg7P
         tIkiqmcBrivStwVODgaLlnYbNBEHMN6701g7AHNSab7oYwZb8Ht0/a3+jpMp2kUKsQot
         L1PveI8yvfId//iLpfu+APrbgubKCS6lcn28Jq2WxqFDBiAJeSdHMKW5OPrpYOO+5GLX
         n8DQyaU8QDWLQVIY9+bnaxGHQTnvda5N/1hAnmV6xcvSjCvQPTfakgv8+RnzcfRc0YMt
         obKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU53RV2+XlX/vPXYOq/HulV3XW5WW4DxCBoRUhBvabU3xWMs+TSvSgr4JAAFm9U2DV623g4CsnhpgLQCRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzREgn80Ttj/eqmW0424OPknsbh6/RO4C0r/kB+z0RwcRmAzmUX
	76bI2N3jM0H9S/TeiHoG56yGiIiELLkU2oNMPnNM9OOibJzHSQQA/I8j+Ihou1PPXw==
X-Gm-Gg: ASbGncs3Cog9Nbrjdnpub3DkHS01afROmHC6KB2EiiyOkEm99x0xj6ELS1+zyXhP6HI
	3bMY02LfrHrqrRQK08P2BrpT4wM1zMq1ueFhMIcTVidgIrp/mK8ZvZAmnTOMOPW2FCT4vatssJr
	Pr7KzOEUVSAAmrm8i1m3dkHn7l93YOzBbRXfVJxRyCtv+1MNawOWCfuwaOgjZ9VG/kPAIr6RxAk
	0gFkNGqfer1uris8SF4YZuRaENRPiLdQ6AKuI3F3tFVxRZ0PVe07O23+T6zcWSYcBn7T2lFNAlF
	74dHqsES3Eerrqx1n8L64MYutGJ0S1iI8SDAr+GImaBMuo2UZf74On7G9xSNpUISRo5y3wErFF3
	SSMRSDIJXl4RBEIe/FD9E+9Pawzf34g==
X-Google-Smtp-Source: AGHT+IH3gvTNWjgUOSwEDk0Lnl1+DmC8Fu1pmwaP64IY32Oe1R+ZFxuAFpTFlieVchNMl10+qUaQLA==
X-Received: by 2002:a17:902:c407:b0:215:42a3:e844 with SMTP id d9443c01a7336-23c5ffbdd35mr3174365ad.17.1751389612305;
        Tue, 01 Jul 2025 10:06:52 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e2423sm109764245ad.37.2025.07.01.10.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:06:51 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:06:47 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Giuliano Procida <gprocida@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gendwarfksyms: use preferred form of sizeof for
 allocation
Message-ID: <20250701170647.GA2234472@google.com>
References: <CAK7LNASzE1CtRo9T4byPXJtB-HtuWsGe=OLba+8JU9fB28Chow@mail.gmail.com>
 <20250701152000.2477659-1-gprocida@google.com>
 <20250701152000.2477659-2-gprocida@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701152000.2477659-2-gprocida@google.com>

On Tue, Jul 01, 2025 at 04:19:10PM +0100, Giuliano Procida wrote:
> The preferred form is to use the variable being allocated to, rather
> than explicitly supplying a type name which might become stale.
> 
> Also do this for memset.
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Giuliano Procida <gprocida@google.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

