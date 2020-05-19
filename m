Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E001D9439
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2020 12:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgESKVq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 May 2020 06:21:46 -0400
Received: from merlin.infradead.org ([205.233.59.134]:58276 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgESKVq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 May 2020 06:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xWoCF9WU8+P6zH55pIbnIh/YF7QO+vlIXLrOeA3o7Zg=; b=1Wm4uHHD9O785s71uZF1SD0h43
        htJi9GfIPTo3zg8VnurLo9CIa1ENv/ee4TkaFY2KgpsxDb9FVzgBfOpCVY9bCvfVWZqlnzy1O7GFF
        Pfsjg/8O4wFpD7KgGArh5MhN3KMydT7B0f7Fm69RbfyL1Yuc/vbvAAm3j0Nt6qtCOhC/hMOyPkQVR
        CrtK7aitoHf+21OA0GzrJKUn3SOsXfbNtUS69w5A/bnsxHqGoDEW07HO1ohHQPVllFW3pFHWkIGod
        8/dztCyzABuz7CvjINUhADBbqh5uf/h0a0D1eUmQ+EnWllrixLLsC0jv22QHRkOK6v3n6iSJJh0Cs
        8LhiDTCQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jazNS-00043O-9D; Tue, 19 May 2020 10:21:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 54B8E3008A8;
        Tue, 19 May 2020 12:21:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 42DD12105F3B6; Tue, 19 May 2020 12:21:33 +0200 (CEST)
Date:   Tue, 19 May 2020 12:21:33 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/29] modpost: add read_text_file() and get_line()
 helpers
Message-ID: <20200519102133.GA279905@hirez.programming.kicks-ass.net>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517094859.2376211-4-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 17, 2020 at 06:48:33PM +0900, Masahiro Yamada wrote:

> +char *read_text_file(const char *filename)
> +{
> +	struct stat st;
> +	int fd;
> +	char *buf;
> +
> +	fd = open(filename, O_RDONLY);
> +	if (fd < 0)
> +		return NULL;
> +
> +	if (fstat(fd, &st) < 0)
> +		return NULL;
> +
> +	buf = NOFAIL(malloc(st.st_size + 1));
> +
> +	if (read(fd, buf, st.st_size) != st.st_size) {

Is this sensible coding ? I've always been taught read() can return
early/short for a number of reasons and we must not assume this is an
error.

The 'normal' way to read a file is something like:

	for (;;) {
		ssize_t ret = read(fd, buf + size, st.st_size - size);
		if (ret < 0) {
			free(buf);
			buf = NULL;
			goto close;
		}
		if (!ret)
			break;

		size += ret;
	}

> +		free(buf);
> +		buf = NULL;
> +		goto close;
> +	}
> +	buf[st.st_size] = '\0';
> +close:
> +	close(fd);
> +
> +	return buf;
> +}
