Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3761BB7A16
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2019 15:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732219AbfISNGU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Sep 2019 09:06:20 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:44069 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732213AbfISNGU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Sep 2019 09:06:20 -0400
Received: by mail-qt1-f182.google.com with SMTP id u40so4042872qth.11
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2019 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=message-id:subject:from:to:cc:date:mime-version
         :content-transfer-encoding;
        bh=IsqRTG9caaUhIK42xkXjoF6FO3aLA3ZmBQE/WyKykk4=;
        b=bX/AXmcFaVfglElnWxWB7XeLoIyuIUuRKwnBOcGM8irKFzDRRnerNcio0q3i5A4QrZ
         cfFzUyk/XPWkTKIGmie6qNNsLqV3OjcAW21aEtGGX5BW7Vqb7/nIiFfi5NvzNi5UMBCl
         vFTUFcnYZ6/7As8USO7Ch8DcS8WfbQzYIxx8Hqiu05tQ3XGoQaOdcXJG7Jt5dpfpHyVR
         3aHQeoHgD5Izv4STeOm35bEQ90niIoP/7YpU/COMAvtqXjRIfuVTVdlEFaOguucjrf3P
         lx5c4aT8F2WZq20vqoSn59Mec7fzVcOEhrBwWS5b0+SCHG0DiWNihwNhgs7u8wkBJIRK
         Ooiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
         :content-transfer-encoding;
        bh=IsqRTG9caaUhIK42xkXjoF6FO3aLA3ZmBQE/WyKykk4=;
        b=cGj7XrwPWPqLhMPF25TNFFJi/nVoOO68muWz8RlXeSTJSJfxrChWyD45ZWaO5/QIqX
         OSXjIQz69xj3exi869pDLcRXJLhJsnMeRoocgtzeF/HaFaGrfIQnwAtMNcfMXrS2nDRY
         E0JsX9zwAEJfw4Tu6HBjcc56n/O7hUEZxqafGwQksuumSMuc5kbvaAdk8f+vW4LtvbFD
         5pqcDM3B7/PrEjy3ismHm5MGJhzJU+Ir4Wt97RYvlnEQf6o3SAXpu9J/GIvpSwS3e9Pj
         /uCupz8jWKJ1oGWq0sT7gBehvivzEFVCo0+8TaDeTJlUgVo4MzhEyfId8osE4WG/EanP
         Tpzw==
X-Gm-Message-State: APjAAAWWQ8F1kKrt7di9lzumEfJBnKbjBEi31B2DlucFnUpA9seYBuUV
        GgYdcf1+FUrTd1sVlG4u8uoJZE/0xas=
X-Google-Smtp-Source: APXvYqzasIZpl9AANzlifB7I5Xk/YzI5eRwkZmoUJoB3pNCXKoD51RWkv6AWvvdUe41/RXWOpLAw6A==
X-Received: by 2002:ac8:7502:: with SMTP id u2mr2829778qtq.216.1568898379188;
        Thu, 19 Sep 2019 06:06:19 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id u132sm4708482qka.50.2019.09.19.06.06.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 06:06:18 -0700 (PDT)
Message-ID: <1568898377.5576.186.camel@lca.pw>
Subject: "arm64: use asm-generic/dma-mapping.h" introduced a kbuild warning
From:   Qian Cai <cai@lca.pw>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Will Deacon <will@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 19 Sep 2019 09:06:17 -0400
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The commit 5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h") introduced a
kbuild warning,

scripts/Makefile.asm-generic:25: redundant generic-y found in
arch/arm64/include/asm/Kbuild: dma-mapping.h


