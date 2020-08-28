Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA96255BB0
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 15:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgH1Nyw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 09:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgH1Nyj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 09:54:39 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93063C061232
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2020 06:54:38 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id g13so1275879ioo.9
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2020 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=WRKo7hiT95deJi9zYbsblqjV9aJcpM8zCpj7qeA/5Zk=;
        b=YVsUzZaBEQ53O+ALtCXuIdqxzBIDW3EcmfvL2hnfvV5xUF4iMm+B4JlwWitKyKbIs5
         Yw0rvFpnIGxEH4Myz5gJ2NpALDj3iGTg5Bn4i0Mx0Z/BHbdOY66/TxbgawDTyD1tEMZF
         rHs1GEtEC3eIlm22ucM6PAACpTOG7ztcIaHojfW5bBDWzs7YEbghB9NncfqparvidAab
         fiNAvhuG3HfI+TTePV+Q7LwtIXWC558ASRrWY30EUskGYay8UPVXfZrH+i+qGZFjU+qT
         yDx7ZUz6/KAHy+euxN+huztZr0ivbC6lsw+iSy6QAb6pisSUCmasBPYwlZR9cUZ9YO27
         iPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WRKo7hiT95deJi9zYbsblqjV9aJcpM8zCpj7qeA/5Zk=;
        b=S/XD1zXVgDbS8gCQ/7ulxyfhngL1tL5e924s0Woi8t0LJAW29IQO2u4ZmU5zsocPh0
         2dzOm8U/ZfruAsE8t7dBvW9Wz2UBN0BTD3LicmJRfasxu+uMfh+fNPppt5JF7il1fd2W
         2e9uYeBW3+H5xLkifmQ5BO9Na+Xb85Js7T/zD1ywcWXi7iN5zQf2wMNX6cjWMIaYPqMY
         SFUsYGdVfcu+cJZgCyhwFoF7GPsfEL3z8uaNm0TPo66r2uVQ/QmTSHEYxFG//KltWuRw
         6/jXnl6VVZU4L8MkPwppc79SmY34wUJFSH+CpEHxUbJ3SSVx7SikjVd7KiLrJwzRYNgb
         KQ3A==
X-Gm-Message-State: AOAM532nVIwG8uWZAvJhWlDsJRjAfhQOMLir4daXx+gkmBaNDXxzsBqv
        ylAz6CtXEaB45DsftqLHT0wINA==
X-Google-Smtp-Source: ABdhPJzLdhaDX6/v6n0jKbkwolcavpJW6jj2Pl4fouvQn8W4qE2qcwsgn7Ax+Pg2ygmQWji3jSEYNg==
X-Received: by 2002:a05:6638:1649:: with SMTP id a9mr1297090jat.115.1598622877380;
        Fri, 28 Aug 2020 06:54:37 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id l144sm623447ill.6.2020.08.28.06.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 06:54:36 -0700 (PDT)
Subject: Re: [PATCH 0/1] block io layer filters api
To:     Sergei Shtepa <sergei.shtepa@veeam.com>, masahiroy@kernel.org,
        michal.lkml@markovi.net, koct9i@gmail.com, jack@suse.cz,
        damien.lemoal@wdc.com, ming.lei@redhat.com, steve@sk2.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org
References: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <7a517822-6be2-7d0d-fae3-31472c85f543@kernel.dk>
Date:   Fri, 28 Aug 2020 07:54:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/27/20 1:13 PM, Sergei Shtepa wrote:
> Hello everyone! Requesting for your comments and suggestions.
> 
> We propose new kernel API that should be beneficial for out-of-tree
> kernel modules of multiple backup vendors: block layer filter API.

That's just a non-starter, I'm afraid. We generally don't carry
infrastructure in the kernel for out-of-tree modules, that includes
even exports of existing code.

If there's a strong use case *in* the kernel, then such functionality
could be entertained.

-- 
Jens Axboe

