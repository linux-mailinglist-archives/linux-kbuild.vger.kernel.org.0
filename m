Return-Path: <linux-kbuild+bounces-10278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB84CD1F4A
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 22:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47FA7301CDAF
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDBA341AB1;
	Fri, 19 Dec 2025 21:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPWljzY0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A9033A9D2;
	Fri, 19 Dec 2025 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179657; cv=none; b=WMTAhICNTZYT3pHCQY2aSEsvyNkbbEEliCXbgyotzGIMtOdSqBxDCc/o+WjFsDvtCFfmlDSRQPzWJAuS32NBPv4WlWH588zWX4+sudB26rVXMatUyTE0/YsrxBs0MkuntEaysc6TIPrCPy9DlbWGH5ovYAUDv++mLE19+WZ2Uvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179657; c=relaxed/simple;
	bh=SGFC3LHtTE6LgnzJE2MQMTlBcQl2traEPWnMCtbdk5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEu1mSJXmPiGwG6qPHqsRK5VmsX302CyJOFel41wB0eVE7zVXiAx4tPyYIn1CYE6reM5Z2BIqAsQAQWOfQWfqvHrQB9A/xXB69ulLv5wNgPcK+F9yJW/JKQxUhe6VGRz+qWBK/p8h3I91s0DBq7XhDL4GyqK45/Q/FBz2qNaInU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPWljzY0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E84BC4CEF1;
	Fri, 19 Dec 2025 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766179656;
	bh=SGFC3LHtTE6LgnzJE2MQMTlBcQl2traEPWnMCtbdk5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPWljzY0gQFgs2p9Tyn8NV9m0XKqp0iCa0/UdiE6RfX+Btnbt5QR7rGSRKA2wJ5/x
	 ICBHwtBpms6jM4fm2uLOiv0oS0EOoJq9pBe/X5X88utan6x53FhmKPrO1Jg10m/KTi
	 If2zkv9i8sTxdE1CDhu/IJu57KLR76wrsm1rWHbUk8CV2j5OMGnWKGWiBAaLUMka7b
	 JEam3bmDS/VVl+yXxun1TzufP8iZvP7yzgqt2ugS5H+c/IIVAHjenQ1JFx++oaKP1a
	 7S5Y/zOEL7CBH6lkCZwnzalP1Z0k7Dcq/1K6qJqiIWu9/O0uaDx5Vs44lyypQQj/Oc
	 Hc8sTqSuE81dA==
Date: Fri, 19 Dec 2025 14:27:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
Message-ID: <20251219212731.GC1407372@ax162>
References: <cover.1766061692.git.gtucker@gtucker.io>
 <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>

On Thu, Dec 18, 2025 at 01:49:52PM +0100, Guillaume Tucker wrote:
...
> +    def __init__(self, args, logger):

Adding something like

    self._args = [
        '--rm',
        '--tty',
        '--volume', f'{os.getcwd()}:/src',
        '--workdir', '/src',
    ]

here then adding an __init__() in the subclasses to append the runtime
specific arguments would allow _do_run() to be moved into
ContainerRuntime(). Otherwise, this looks pretty good and extensible.

> +        self._uid = args.uid or os.getuid()
> +        self._gid = args.gid or args.uid or os.getgid()
> +        self._env_file = args.env_file
> +        self._logger = logger
> +
> +    @classmethod
> +    def is_present(cls):
> +        """Determine whether the runtime is present on the system"""
> +        return shutil.which(cls.name) is not None
> +
> +    @abc.abstractmethod
> +    def _do_run(self, image, cmd, container_name):
> +        """Runtime-specific handler to run a command in a container"""
> +
> +    @abc.abstractmethod
> +    def _do_abort(self, container_name):
> +        """Runtime-specific handler to abort a command in running container"""
> +
> +    def run(self, image, cmd):
> +        """Run a command in a runtime container"""
> +        container_name = str(uuid.uuid4())
> +        self._logger.debug("container: %s", container_name)
> +        try:
> +            return self._do_run(image, cmd, container_name)
> +        except KeyboardInterrupt:
> +            self._logger.error("user aborted")
> +            self._do_abort(container_name)
> +            return 1
> +
> +
> +class DockerRuntime(ContainerRuntime):
> +    """Run a command in a Docker container"""
> +
> +    name = 'docker'
> +
> +    def _do_run(self, image, cmd, container_name):
> +        cmdline = [
> +            'docker', 'run',
> +            '--name', container_name,
> +            '--rm',
> +            '--tty',
> +            '--volume', f'{os.getcwd()}:/src',
> +            '--workdir', '/src',
> +            '--user', f'{self._uid}:{self._gid}'
> +        ]
> +        if self._env_file:
> +            cmdline += ['--env-file', self._env_file]
> +        cmdline.append(image)
> +        cmdline += cmd
> +        return subprocess.call(cmdline)
> +
> +    def _do_abort(self, container_name):
> +        subprocess.call(['docker', 'kill', container_name])
> +
> +
> +class PodmanRuntime(ContainerRuntime):
> +    """Run a command in a Podman container"""
> +
> +    name = 'podman'
> +
> +    def _do_run(self, image, cmd, container_name):
> +        cmdline = [
> +            'podman', 'run',
> +            '--name', container_name,
> +            '--rm',
> +            '--tty',
> +            '--interactive',
> +            '--volume', f'{os.getcwd()}:/src',
> +            '--workdir', '/src',
> +            '--userns', f'keep-id:uid={self._uid},gid={self._gid}',
> +        ]
> +        if self._env_file:
> +            cmdline += ['--env-file', self._env_file]
> +        cmdline.append(image)
> +        cmdline += cmd
> +        return subprocess.call(cmdline)
> +
> +    def _do_abort(self, container_name):
> +        pass  # Signals are handled by Podman in interactive mode

Cheers,
Nathan

