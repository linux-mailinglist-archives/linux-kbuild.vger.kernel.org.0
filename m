Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B7524CB7E
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 05:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgHUDov (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 23:44:51 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25396 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgHUDov (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 23:44:51 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07L3iYNR006929;
        Fri, 21 Aug 2020 12:44:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07L3iYNR006929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597981475;
        bh=NcTV0rU4lqUzCGeSvj+IhR2DmoMnjOnTSqkCOLXjihI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CnIvqsKvc0gf0dxrbxdAc+BzYbQk4qOqDIIFTsP4aGjhh+9mcR3pMU+Qpmx506QgA
         bI3Wyk2Y1ClTvdt38adMcLST/8OJKx0UkBLvFEmGnCn+BV2Cx7/MrvqfOZXNg4+inC
         +PofSWTJfNgvEwNczWxoW6om1BM3DFnZMdfY/f6U//78Tm2Tb4ZvYynONHFsklAzJ0
         QF/n2XLyefgMFhAquUgmEAJeQQ2ITbvSlquE8BMvEQhNJmz7syrmGYPAIVrz8uAAWt
         /3fErwUqcBsCD2l6jb4Rjq4G2ZnLsssPfVTkUj1jr6mkzQyFORUBL07YeQkE1yqlSV
         9pvi0Rk0bJ2aQ==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id d20so160159ual.13;
        Thu, 20 Aug 2020 20:44:35 -0700 (PDT)
X-Gm-Message-State: AOAM531AIdH1jVFcJhWkFrBUSei9Ltt90ia/FiU5/ROHjFNE3i/7VAXI
        iwCUjy4oVsh14ECO70erLFOhORmY0aiwH8yp2os=
X-Google-Smtp-Source: ABdhPJwyVtkEj0z6jbnZ/ZYmrdRit6XeU5c258QdTKoyURxGnPxMSmgPltgrdQ/tb1o3/w8aLnbUYHZgVFIi1z3jZz0=
X-Received: by 2002:ab0:108:: with SMTP id 8mr452069uak.25.1597981474093; Thu,
 20 Aug 2020 20:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200820174328.490374-1-masahiroy@kernel.org> <20200820174328.490374-2-masahiroy@kernel.org>
In-Reply-To: <20200820174328.490374-2-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 21 Aug 2020 12:43:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT=w6o7z-V57t0oXfN5swurWt1LtCVx_pst6=tR0C-m8Q@mail.gmail.com>
Message-ID: <CAK7LNAT=w6o7z-V57t0oXfN5swurWt1LtCVx_pst6=tR0C-m8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: qconf: replace depreacated
 QString::sprintf() with QTextStream
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Robert Crawford <flacycads@cox.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I will fix the typo in the subject.

"depreacated" -> "deprecated"




-- 
Best Regards
Masahiro Yamada
