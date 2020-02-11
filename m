Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB721589BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 06:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgBKFpn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Feb 2020 00:45:43 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36006 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgBKFpm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 00:45:42 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so1926111wma.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 21:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=upn35/PykylPih5SjrtOcB3Wr/JxTfrTVqi5d6qAqps=;
        b=Tk3TsQAXs5yISP8d1J9lPWqi4Uz6aTXDUUdiQlv8la5sRB98/hhTMi4Hs8zroBdkbF
         UZBt71jujvN26K8k7KrsHdS9vDcGzl0KUaSWuokClPlmyE5iy50sL1AbnF5zgprc9EaM
         N6VmY+QXXmTF/B6Oat7wAM+Uj+w74ca5PoNRcAjagKN6nkgLbRUQdVZPQ4jXgF7eIxFe
         WSIRNXBufv+gpr/g0f6ICQG+jGa7b4fOMZ9bRHJPfJIRKaJ4Y/BTjNIPZg7pWLuEFZ2P
         AZnPdoLNIGmB63JJ015liUwnpuqmFWEBUQFoAVMPLGJdKM57BSYiziKbu0UiHEqqiLAZ
         81LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=upn35/PykylPih5SjrtOcB3Wr/JxTfrTVqi5d6qAqps=;
        b=rEdWrmdRfRJJHV2MRUjlLFFnZ1A1hXpDW10c7D8Rs856iu/U5q3f1BixYr2YKXxqnG
         Syxm2WsD1KNXZ/gw0x+JjFs0WbptrXU3BU8i1xrG+RefbJpIy5wzgcMl7KSySKveNVGI
         qOYUYcXXv6EwLnXTPv8rWm9rkDOB2SCsUnM9ssg1DoEIHo6RNuBwhPNS/SWMURt8FbdU
         IbVAZu/iJU2wNQuNEc5imYt6XK9LDX7nq0AnNVrFMEhCDRIbXKpC+9S3BKnZmxFbdZOT
         j9gB7c2T/bV+lFITsBnx1YEwy2JdmqhwbijOBqfnDbbkd/NSX+q8rx8MSP5wRHsk+STV
         L8/w==
X-Gm-Message-State: APjAAAXqkV6Iyb310uH26BsN71sfRog6xgVHfwlOlp7EAD64fjFM0xzq
        Hb+99ZADD/x8W9gay+CuJAqG9A==
X-Google-Smtp-Source: APXvYqygAsO9qHbIGqg709UCKpNlewSUxNe6Dh8uN4RHoJZtaCXckWw550lDGZKaui1PccMPjm3J3Q==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr3643374wmg.16.1581399938921;
        Mon, 10 Feb 2020 21:45:38 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id f62sm2233864wmf.36.2020.02.10.21.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 21:45:38 -0800 (PST)
Date:   Tue, 11 Feb 2020 05:45:34 +0000
From:   Quentin Perret <qperret@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 2/3] kbuild: split adjust_autoksyms.sh in two parts
Message-ID: <20200211054534.GC72419@google.com>
References: <20200207180755.100561-1-qperret@google.com>
 <20200207180755.100561-3-qperret@google.com>
 <CAK7LNARaEjo7g4=3o-F29Extru8+mYCDqY1i_Gzvra=JB-eZhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARaEjo7g4=3o-F29Extru8+mYCDqY1i_Gzvra=JB-eZhw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Saturday 08 Feb 2020 at 06:08:08 (+0100), Masahiro Yamada wrote:
> In 3/3, you will call this script with $(CONFIG_SHELL) from Makefile.
> 
> For consistency,
> 
> $CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
> 
> is better.

Agreed, I'll fix this in v4.

Thanks,
Quentin
