Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1266315B23C
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 21:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgBLUxN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 15:53:13 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51859 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbgBLUxN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 15:53:13 -0500
Received: by mail-wm1-f67.google.com with SMTP id t23so3885917wmi.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2020 12:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kFOHrpvoYdP7OqqBcaBxRlx/UgtY/2nbvrQxY1R/DAQ=;
        b=hsJzu2yhhXMvBUkPigrLXe6r7tNTYcLNI8czQb7YGNMNUOEZl5OW1NdrKk+kmGJvpZ
         sUNELcaTxujQJCz/UxlG1InPNOJy4wzeB0zIK8QM0vLOmkAPa84cOEFBbheGU8kxRhSL
         XvZ1HIUHxWUOaiZLQk5GKgZcGsqWG+Ifzcvmog12TJATUGov6vz4Qr9OGZbIvC2c4LNI
         Asus77RqJ5tUvMoqR+CHbz4urEYz4BQ/xRB/NT+Nr+nbtpnHl0a5dGVZfxTDxt9U/HPR
         vh5hdtxbJ/fRfchmu+ePxUJiD10Nyii8EbwIaA4NsLHk+RU1/euhwLs7/pnxZPKfSYZl
         zxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kFOHrpvoYdP7OqqBcaBxRlx/UgtY/2nbvrQxY1R/DAQ=;
        b=AwwmZPIEcF6tELqSKkq1F0zTJSkhA+HZpmUlYak54AdKp+x4eUvO8Nwzx20MO353tl
         3GMtvcXmDUGNmFCaPw/CYH+nfWs6i47bgtHAAULdw3a2igH1OqhfsfKPjdQeTuxZg9Gs
         X9YypdRnziaoAehz8HRxtKG51ER3L+5qEz0aBgkT1VrraRYHtB+DJHS/2flV/LANT9dj
         EAbR+37U4oqSSL2fqk9iRS2+P7SlhN/zgAHSVKrc3ikOUSBBb1PELFxLZqLlaitIbkbQ
         YRaXeonrIOSxXaqFIUAwWilVmB6qcUwMI7EHbGEo2LnVASFUN+77/1q0qjIUcup2OsX5
         qCiQ==
X-Gm-Message-State: APjAAAVZC5AOnjk10r/Jue/MDOSQRg+1sbR0nCl62kWSrUVg79sOHyiK
        nxI/8mQjT/dIXGPWuveno7/8cA==
X-Google-Smtp-Source: APXvYqyuffDl7NHzkrxWTOSB46ChHm25e1ar7WZ4d+epLaumvdvfi15LiCYsabhSOva/hebgpfTjvA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr944970wmk.172.1581540790749;
        Wed, 12 Feb 2020 12:53:10 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id r1sm1996023wrx.11.2020.02.12.12.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 12:53:10 -0800 (PST)
Date:   Wed, 12 Feb 2020 20:53:07 +0000
From:   Quentin Perret <qperret@google.com>
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     masahiroy@kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, maennich@google.com,
        kernel-team@android.com, jeyu@kernel.org, hch@infradead.org
Subject: Re: [PATCH v4 0/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYM
Message-ID: <20200212205307.GA148347@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <nycvar.YSQ.7.76.2002121545120.1559@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.2002121545120.1559@knanqh.ubzr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wednesday 12 Feb 2020 at 15:48:50 (-0500), Nicolas Pitre wrote:
> For the whole series:
> 
> Acked-by: Nicolas Pitre <nico@fluxnic.net>

Thanks!
Quentin
